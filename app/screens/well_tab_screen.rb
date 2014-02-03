class WellTabScreen < PM::Screen
  title "Wells"

  def will_appear
    view.backgroundColor = UIColor.whiteColor

    @label = UILabel.new
    @label.text = "#{App::Persistence['well_name']}"
    @label.textColor = UIColor.grayColor
    @label.backgroundColor = UIColor.clearColor
    @label.textAlignment = UITextAlignmentCenter
    @label.font = UIFont.fontWithName('Titillium Web', size:30)

    Motion::Layout.new do |layout|
      layout.view view
      layout.subviews "label" => @label
      layout.metrics "top" => 250
      layout.vertical "|-top-[label(==30)]"
      layout.horizontal "|[label]|"
    end
  end
end