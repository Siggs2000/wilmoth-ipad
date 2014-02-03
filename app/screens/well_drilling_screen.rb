class WellDrillingScreen < PM::Screen
  title "Drilling"
  tab_bar_item title: "Drilling", icon: "more"

  def will_appear
    set_tab_bar_item system_icon: :more 
    view.backgroundColor = UIColor.whiteColor
  end
end