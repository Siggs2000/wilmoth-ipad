class WellReportScreen < PM::GroupedTableScreen

  def on_load
    get_previous_reports
  end

  def table_data
  # [{
  #   title: "Northwest States",
  #   cells: [
  #     { title: "Oregon", action: :tapped_state },
  #     { title: "Washington", action: :tapped_state }
  #   ]
  # }]


  [{
    title: "Previous Reports",
    cells:
      @prod_reports_array.each.map do |report|
        {
          title: report[0],
          action: :tapped_state
        }
      end
    }]


  # [{
  #   @prod_reports_array.each.map do |report|
  #     {
  #     title: "#{report[4]}",
  #     cells: [
  #         { title: "#{report[0]}", action: :tapped_state },
  #         { title: "#{report[1]}", action: :tapped_state }
  #       ]}
  #   end
  #   }]
  end

  def get_previous_reports
    well = Well.where(:name).eq(App::Persistence['well_name']).first
    well_id = well.id

    @prod_reports_array = []
    if WellProduction.where(:well_id).eq(well_id).count != 0
      WellProduction.where(:well_id).eq(well_id).each do |x|
        report = []
        report << x.current_status
        report << x.casing_pressure
        report << x.tubing_pressure
        report << x.line_pressure
        report << x.item_added
        report << x.quantity_items_added
        report << x.operation_conducted
        report << x.current_production
        report << x.water_tank_level
        report << x.notes
        report << x.created_at
        @prod_reports_array << report
      end
    else
      p "No reports yet"
    end
  end  

  def tapped_state
    p "tapping it"
  end
end