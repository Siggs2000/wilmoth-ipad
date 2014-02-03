class HomeScreen < PM::Screen

  title "Home"

  def on_load

  end

  def on_appear
 
  end

  def will_appear
    view.backgroundColor = UIColor.whiteColor

    button_image = UIImage.imageNamed("wells_button.png")
    @well_button = UIButton.buttonWithType(UIButtonTypeCustom)
    @well_button.setBackgroundImage(button_image, forState: UIControlStateNormal)
    @well_button.addTarget(self,
                              action:'open_wells',
                              forControlEvents:UIControlEventTouchUpInside) 

    button_image = UIImage.imageNamed("pipelines_button.png")
    @pipe_button = UIButton.buttonWithType(UIButtonTypeCustom)
    @pipe_button.setBackgroundImage(button_image, forState: UIControlStateNormal)
    @pipe_button.addTarget(self,
                              action:'open_wells',
                              forControlEvents:UIControlEventTouchUpInside) 

    button_image = UIImage.imageNamed("sales_meters_button.png")
    @sales_meter_button = UIButton.buttonWithType(UIButtonTypeCustom)
    @sales_meter_button.setBackgroundImage(button_image, forState: UIControlStateNormal)
    @sales_meter_button.addTarget(self,
                              action:'open_wells',
                              forControlEvents:UIControlEventTouchUpInside) 

    button_image = UIImage.imageNamed("otb_button.png")
    @otb_button = UIButton.buttonWithType(UIButtonTypeCustom)
    @otb_button.setBackgroundImage(button_image, forState: UIControlStateNormal)
    @otb_button.addTarget(self,
                              action:'open_wells',
                              forControlEvents:UIControlEventTouchUpInside) 

    button_image = UIImage.imageNamed("gas_button.png")
    @gas_button = UIButton.buttonWithType(UIButtonTypeCustom)
    @gas_button.setBackgroundImage(button_image, forState: UIControlStateNormal)
    @gas_button.addTarget(self,
                              action:'open_wells',
                              forControlEvents:UIControlEventTouchUpInside) 

    button_image = UIImage.imageNamed("consumer_meters_button.png")
    @con_meter_button = UIButton.buttonWithType(UIButtonTypeCustom)
    @con_meter_button.setBackgroundImage(button_image, forState: UIControlStateNormal)
    @con_meter_button.addTarget(self,
                              action:'open_wells',
                              forControlEvents:UIControlEventTouchUpInside) 

    button_image = UIImage.imageNamed("sync.png")
    @sync_button = UIButton.buttonWithType(UIButtonTypeCustom)
    @sync_button.setBackgroundImage(button_image, forState: UIControlStateNormal)
    @sync_button.addTarget(self,
                              action:'sync_now',
                              forControlEvents:UIControlEventTouchUpInside) 

    Motion::Layout.new do |layout|
      layout.view view
      layout.subviews "well_button" => @well_button, "sync_button" => @sync_button, "pipe_button" => @pipe_button, "sales_meter_button" => @sales_meter_button, "otb_button" => @otb_button, "gas_button" => @gas_button, "con_meter_button" => @con_meter_button
      layout.metrics "top" => 45, "margin" => 20, "height" => 40, "height2" => 250, "height3" => 75
      layout.vertical "|-250-[pipe_button(==height3)]"
      layout.vertical "|-250-[sales_meter_button(==height3)]"
      layout.vertical "|-250-[otb_button(==height3)]"
      layout.vertical "|-410-[well_button(==height3)]"
      layout.vertical "|-(>=100)-[sync_button(==height3)]-(==50)-|"
      layout.horizontal "|-height-[pipe_button(==140)]-15-[sales_meter_button(==140)]-15-[otb_button(==140)]-(>=15)-|"
      layout.horizontal "|-(>=100)-[well_button(==140)]-15-|"
      layout.horizontal "|-(==50)-[sync_button(==140)]-(>=100)-|"
    end
  end

  def open_wells
    #app_delegate.activate_well_screen
    app_delegate.activate_sales_group_select
  end

  def sync_now
    # IMPORT SALES GROUPS
    BW::HTTP.get("http://wilmoth.herokuapp.com/api/v1/sales_groups") do |response|
      p response.body.to_str
      json = BW::JSON.parse(response.body.to_str)
      json.each do |x| 
         sales_group = SalesGroup.create
         sales_group.name = x['name']
         sales_group.api_id = x['id']
      end
    end
      UIAlertView.alert("Sales Groups Imported", buttons: ["OK"],
        message: "Ready to import wells?") { |button|
        if button == "OK"
        end
      }
    #IMPORT WELLS
    # SVProgressHUD.showWithStatus("Waiting for agents to respond", maskType:SVProgressHUDMaskTypeBlack)
    BW::HTTP.get("http://wilmoth.herokuapp.com/api/v1/wells") do |response|
      p response.body.to_str
      json = BW::JSON.parse(response.body.to_str)
      json.each do |x| 
         well = Well.create
         well.sales_group_id = x['sales_group_id']
         well.name = x['name']
         well.api_permit_num = x['api_permit_num']
         well.operator = x['operator']
         well.state = x['state']
      end
      UIAlertView.alert("Sync Successful", buttons: ["OK"],
        message: "We've successfully imported all Well and Sales Group data") { |button|
        if button == "OK"
        end
      }
    end
    # SVProgressHUD.dismiss

    SalesGroup.save_all
    Well.save_all
  end
end
