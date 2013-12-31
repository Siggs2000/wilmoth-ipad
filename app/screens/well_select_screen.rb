class WellSelectScreen < PM::Screen
    title "Select Well"
  def on_appear
    

    self.split_screen # => PM::SplitViewController instance
    self.split_screen.master_screen # => WellsSelectScreen
    self.split_screen.detail_screen # => WellScreen
  end
end