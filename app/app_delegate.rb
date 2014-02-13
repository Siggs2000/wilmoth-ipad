class AppDelegate < PM::Delegate
  status_bar true, animation: :none

  def on_load(app, options)
    activate_home_screen
    #open NewSalesGroupScreen.new(nav_bar: true)
    Well.load_all
    WellDrilling.load_all
    WellMech.load_all
    WellProduction.load_all

    SalesGroup.load_all
  end

  def on_unload
    Well.save_all
    WellDrilling.save_all
    WellMech.save_all
    WellProduction.save_all

    SalesGroup.save_all    
  end

  def activate_home_screen
    self.home_screen ||= HomeScreen.new(nav_bar: true)
    open self.home_screen
  end

  def activate_well_screen
    @split_screen = open_split_screen WellSelectScreen.new(nav_bar: true), WellsScreen.new(nav_bar: true)
  end

  def activate_sales_group_select
    @split_screen = open_split_screen SalesGroupSelectScreen.new(nav_bar: true), SalesGroupScreen.new(nav_bar: true)
  end

  def activate_full_well_screen
    #self.well_tab_screen ||= WellTabScreen.new(nav_bar: true)
    #open WellTabScreen.new(nav_bar: true)
    open_tab_bar WellProductionScreen, WellDrillingScreen.new(nav_bar: true), WellMechScreen, WellPhysScreen
  end
  
  def activate_well_report_screen
    @split_screen = open_split_screen WellReportScreen.new(nav_bar: true), WellProductionScreen.new(nav_bar: true)
  end
end
