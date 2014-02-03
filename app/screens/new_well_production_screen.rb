class NewWellProductionScreen < PM::FormotionScreen
  title "New Production Report"

  def table_data
    {
      sections: [{
        title: "New Production Report",
        rows: [{
          title: "Current Status",
          key: :current_status,
          type: :picker,
          items: ["Producing", "Shut In", "Pre-production"]           
          }, {
          title: "Casing Pressure",
          key: :casing_pressure,
          type: :number,
          auto_correction: :no,
          auto_capitalization: :none
          }, {
          title: "Tubing Pressure",
          key: :tubing_pressure,
          type: :number,
          auto_correction: :no,
          auto_capitalization: :none
          }, {
          title: "Line Pressure",
          key: :line_pressure,
          type: :number,
          auto_correction: :no,
          auto_capitalization: :none
          }, {
          title: "Item Added",
          key: :item_added,
          type: :picker,
          items: ["Soap Stick", "Liquid"]  
          }, {
          title: "Quantity of Items Added",
          key: :quantity_added,
          type: :number
          }, {
          title: "Operation Conducted",
          key: :operation_conducted,
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
          }, {
          title: "Current Production",
          key: :current_production,
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
          }, {
          title: "Water Tank Level",
          key: :water_tank_level,
          type: :number,
          auto_correction: :no,
          auto_capitalization: :none
          }, {
          title: "Notes",
          key: :notes,
          type: :text,
          auto_correction: :no,
          auto_capitalization: :none
          }, {
                  title: "Submit",
                  key: :submit,
                  type: :submit
                  }]
        }]
    }
  end

  def on_submit(form)
    wp = WellProduction.create
    wp.well_id = Well.where(:name).eq(App::Persistence['well_name']).last.id
    wp.current_status = form.render[:current_status]
    wp.casing_pressure = form.render[:casing_pressure]
    wp.tubing_pressure = form.render[:tubing_pressure]
    wp.line_pressure = form.render[:line_pressure]
    wp.item_added = form.render[:item_added]
    wp.quantity_items_added = form.render[:quantity_added]
    wp.operation_conducted = form.render[:operation_conducted]
    wp.current_production = form.render[:current_production]
    wp.water_tank_level = form.render[:water_tank_level]
    wp.notes = form.render[:notes]
    wp.created_at = NSDate.new
    App.alert("New Production Report Created")
    # app_delegate.activate_home_screen
    open HomeScreen.new
  end
end