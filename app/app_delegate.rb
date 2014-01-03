class AppDelegate < PM::Delegate
  status_bar true, animation: :none

  def on_load(app, options)
    activate_home_screen
    #open NewSalesGroupScreen.new(nav_bar: true)
  end

  def activate_home_screen
    self.home_screen ||= HomeScreen.new(nav_bar: true)
    open self.home_screen
  end

  def activate_well_screen
    @split_screen = open_split_screen WellSelectScreen.new(nav_bar: true), WellsScreen.new(nav_bar: true)
  end
  
end
