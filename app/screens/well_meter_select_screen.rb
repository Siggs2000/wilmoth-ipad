class WellMeterSelectScreen < PM::Screen
  title "Well or Meter?"

  def will_appear
    view.backgroundColor = UIColor.whiteColor

    @label = UILabel.new
    @label.text = "Sales Group: #{App::Persistence['sales_group_name']}"
    @label.textColor = UIColor.grayColor
    @label.backgroundColor = UIColor.clearColor
    @label.textAlignment = UITextAlignmentCenter
    @label.font = UIFont.fontWithName('Titillium Web', size:30)


    button_image = UIImage.imageNamed("wells_button.png")
    @well_button = UIButton.buttonWithType(UIButtonTypeCustom)
    @well_button.setBackgroundImage(button_image, forState: UIControlStateNormal)
    @well_button.addTarget(self,
                              action:'open_wells',
                              forControlEvents:UIControlEventTouchUpInside) 

    button_image = UIImage.imageNamed("sales_meters_button.png")
    @sales_meter_button = UIButton.buttonWithType(UIButtonTypeCustom)
    @sales_meter_button.setBackgroundImage(button_image, forState: UIControlStateNormal)
    @sales_meter_button.addTarget(self,
                              action:'open_wells',
                              forControlEvents:UIControlEventTouchUpInside)

    Motion::Layout.new do |layout|
      layout.view view
      layout.subviews "label" => @label, "sales_meter_button" => @sales_meter_button, "well_button" => @well_button
      layout.metrics "top" => 250
      layout.vertical "|-top-[label(==30)]"
      layout.vertical "|-350-[sales_meter_button(==75)]|"
      layout.vertical "|-350-[well_button(==75)]|"
      layout.horizontal "|[label]|"
      layout.horizontal "|-30-[sales_meter_button(==140)]-(>=100)-|"
      layout.horizontal "|-(>=100)-[well_button(==140)]-30-|"
    end
  end

  def open_wells
    app_delegate.app_delegate.activate_well_screen
  end

end