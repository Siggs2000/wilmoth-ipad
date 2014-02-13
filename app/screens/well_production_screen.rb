class WellProductionScreen < PM::Screen
  title "#{App::Persistence['well_name']} Production"
  tab_bar_item title: "Production", icon: "list"

  def will_appear
    get_previous_reports

    view.backgroundColor = UIColor.whiteColor

    @label = UILabel.new
    @label.text = "Previous Production Reports"
    @label.textColor = UIColor.grayColor
    @label.backgroundColor = UIColor.clearColor
    @label.textAlignment = UITextAlignmentCenter
    @label.font = UIFont.fontWithName('Titillium Web', size:30)

    # @reports_date = UITextView.new
    # @reports_date.font = UIFont.systemFontOfSize(20)
    # @reports_date.text = @prod_reports_date_array[0][10]
    # @reports_date.textAlignment = UITextAlignmentCenter
    # @reports_date.textColor = UIColor.grayColor
    # @reports_date.backgroundColor = UIColor.clearColor 
    # @reports_date.editable = false   

    @reports = UITextView.new
    @reports.font = UIFont.systemFontOfSize(20)
    @reports.text = @prod_reports_array[0][0]
    @reports.textAlignment = UITextAlignmentCenter
    @reports.textColor = UIColor.grayColor
    @reports.backgroundColor = UIColor.clearColor 
    @reports.editable = false      

    button_image = UIImage.imageNamed("new_prod_button.png")
    @new_prod_button = UIButton.buttonWithType(UIButtonTypeCustom)
    @new_prod_button.setBackgroundImage(button_image, forState: UIControlStateNormal)
    @new_prod_button.addTarget(self,
                              action:'open_prod_report',
                              forControlEvents:UIControlEventTouchUpInside) 

    button_image = UIImage.imageNamed("new_photo_button.png")
    @new_photo_button = UIButton.buttonWithType(UIButtonTypeCustom)
    @new_photo_button.setBackgroundImage(button_image, forState: UIControlStateNormal)
    @new_photo_button.addTarget(self,
                              action:'open_prod_report',
                              forControlEvents:UIControlEventTouchUpInside) 

    button_image = UIImage.imageNamed("upload_file_button.png")
    @upload_file_button = UIButton.buttonWithType(UIButtonTypeCustom)
    @upload_file_button.setBackgroundImage(button_image, forState: UIControlStateNormal)
    @upload_file_button.addTarget(self,
                              action:'open_prod_report',
                              forControlEvents:UIControlEventTouchUpInside)     

    Motion::Layout.new do |layout|
      layout.view view
      layout.subviews "new_prod_button" => @new_prod_button, "new_photo_button" => @new_photo_button, "label" => @label, "reports" => @reports#, "reports_date" => @reports_date
      layout.metrics "top" => 85, "margin" => 20, "height" => 40, "height2" => 250, "height3" => 75, "space" => 20
      layout.vertical "|-top-[label(==30)]-margin-|"
      #layout.vertical "|-(==105)-[reports(==30)]-(>=80)-|"
      #layout.vertical "|-(==75)-[reports(==30)]-(>=80)-|"
      layout.vertical "|-(>=100)-[new_prod_button(==height3)]-(==80)-|"
      layout.vertical "|-(>=100)-[new_photo_button(==height3)]-(==80)-|"
      #layout.vertical "|-(>=100)-[upload_file_button(==height3)]-(==80)-|"
      layout.horizontal "|[label]|"
      #layout.horizontal "|[reports_date]|"
      #layout.horizontal "|[reports]|"
      layout.horizontal "|-height-[new_prod_button(==180)]-(>=100)-|"
      layout.horizontal "|-(>=100)-[new_photo_button(==180)]-height-|"
    end
  end

  def open_prod_report
    p "Pressing New Production Button"
    open NewWellProductionScreen.new
  end

  def get_previous_reports
    well = Well.where(:name).eq(App::Persistence['well_name']).first
    well_id = well.id

    @prod_reports_array = []
    if WellProduction.where(:well_id).eq(well_id).count != 0
      WellProduction.where(:well_id).eq(well_id).each do |x|
        report = []
        report << x.current_status
        report << x.casing_pressure
        report << x.tubing_pressure
        report << x.line_pressure
        report << x.item_added
        report << x.quantity_items_added
        report << x.operation_conducted
        report << x.current_production
        report << x.water_tank_level
        report << x.notes
        report << x.created_at
        @prod_reports_array << report
      end
    else
      p "No reports yet"
    end
  end
end