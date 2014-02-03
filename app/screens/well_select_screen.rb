class WellSelectScreen < PM::FormotionScreen
  title "Select Well"

  def on_load
    @array = []
    @sales_group_id = SalesGroup.where(:name).eq("#{App::Persistence['sales_group_name']}").last.api_id
    Well.where(:sales_group_id).eq(@sales_group_id).each do |x|
      @array << x.name
    end
    update_table_data
  end

  def table_data
    {
      sections: [{
        title: "Select Well",
        rows: [{
          title: "Tap to Select Well",
          key: :well,
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
    App::Persistence['well_name'] = form.render[:well]
    app_delegate.activate_full_well_screen
  end
end