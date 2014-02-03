class SalesGroupSelectScreen < PM::FormotionScreen
  title "Select Sales Group"

  def on_load
    set_nav_bar_button :left, title: "Back", action: :back_to_home
    @array = []
    SalesGroup.all.each do |x|
      @array << x.name
    end
    update_table_data
  end

  def table_data
    {
      sections: [{
        title: "Select Sales Group",
        rows: [{
          title: "Tap to Select Sales Group",
          key: :sales_group,
          type: :picker,
          items: @array           
          }, {
          title: "Submit",
          key: :submit,
          type: :submit
          }]
        }]
    }
  end

  def on_submit(form)
    App::Persistence['sales_group_name'] = form.render[:sales_group]
    # app_delegate.activate_well_screen
    open WellMeterSelectScreen, in_detail: true
  end

  def back_to_home
    app_delegate.activate_home_screen
  end
end