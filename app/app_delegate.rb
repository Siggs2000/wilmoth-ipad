class AppDelegate < PM::Delegate
  status_bar true, animation: :none

  def on_load(app, options)
      open_split_screen WellSelectScreen, WellsScreen, {
    icon: "split-icon",
    title: "Split Screen Title",
    button_title: "Some other title"
  }
    #open HomeScreen.new(nav_bar: true)

  end
  
end
