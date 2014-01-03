class HomeScreen < PM::Screen

  title "Home"

  def on_load

  end

  def on_appear
 
  end

  def will_appear
    button_image = UIImage.imageNamed("wells_button.png")
    @well_button = UIButton.buttonWithType(UIButtonTypeCustom)
    @well_button.setBackgroundImage(button_image, forState: UIControlStateNormal)
    @well_button.addTarget(self,
                              action:'open_wells',
                              forControlEvents:UIControlEventTouchUpInside) 

    Motion::Layout.new do |layout|
      layout.view view
      layout.subviews "well_button" => @well_button
      layout.metrics "top" => 45, "margin" => 20, "height" => 40, "height2" => 250, "height3" => 75
      layout.vertical "|-410-[well_button(==height3)]"
      layout.horizontal "|-(>=100)-[well_button(==140)]-15-|"
    end
  end

  def open_wells
    app_delegate.activate_well_screen
  end

end
