class WellPhysScreen < PM::Screen
  title "Physical Characteristics"
  tab_bar_item title: "Physical", icon: "list"

  def will_appear
    view.backgroundColor = UIColor.whiteColor
  end
end