class WellMechScreen < PM::Screen
  title "Mechanical"
  tab_bar_item title: "Mechanical", icon: "list"

  def will_appear
    view.backgroundColor = UIColor.whiteColor
  end
end