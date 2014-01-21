class NewWellScreen < PM::FormotionScreen
  title "Add a Well"

  def table_data
    {
      sections: [{
        title: "New Well",
        rows: [{
          title: "Sales Group",
          key: :sales_group,
          type: :picker,
          items: ["New York", "Pennsylvania", "New Jersey", "Delaware"]           
          }, {
          title: "Name",
          key: :name,
          placeholder: "Well Name",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
          }, {
          title: "API / Permit Num",
          key: :api_permit_num,
          placeholder: "Api / Permit Number",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
          }, {
          title: "Operator",
          key: :operator,
          placeholder: "Operator",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
          }, {
          title: "Latitude",
          key: :lat,
          placeholder: "Latitude of well",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
          }, {
          title: "Longitude",
          key: :lon,
          placeholder: "Lon",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
          }, {
          title: "Township",
          key: :township,
          placeholder: "Township",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
          }, {
          title: "County",
          key: :county,
          placeholder: "County",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
          }, {
          title: "Surface Casing Depth",
          key: :surface_casing_depth,
          placeholder: "Depth of casing",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
          }, {
          title: "Production Casing Depth",
          key: :production_casing_depth,
          placeholder: "Production Casing Depth",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
          }, {
          title: "Cement Top",
          key: :cement_top,
          placeholder: "Cement Top",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
          }, {
          title: "Tubing Depth",
          key: :tubing_depth,
          placeholder: "Tubing Depth",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
          }, {
          title: "Surface Casing Notes",
          key: :surface_casing_notes,
          placeholder: "Production Casing Depth",
          type: :text,
          auto_correction: :no,
          auto_capitalization: :none
          }, {
          title: "Production Casing Notes",
          key: :production_casing_notes,
          placeholder: "Production Casing Notes",
          type: :text,
          auto_correction: :no,
          auto_capitalization: :none
          }, {
          title: "Meter Type",
          key: :meter_type,
          placeholder: "Meter Type",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
          }, {
          title: "Meter Orfice Size",
          key: :current_meter_orfice_size,
          placeholder: "Current Meter Orfice Size",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
          }, {
          title: "Person Assigned",
          key: :person_assigned,
          placeholder: "Person Assigned",
          type: :string,
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
    sales_group = form.render[:sales_group]
    find_sales_group_id(sales_group)
    sleep 1

    well = Well.create
    well.name = form.render[:name]
    well.sales_group_id = @sg
    well.api_permit_num = form.render[:api_permit_num]
    well.operator = form.render[:operator]
    well.lat = form.render[:lat]
    well.lon = form.render[:lon]
    well.state = form.render[:state]
    well.township = form.render[:township]
    well.county = form.render[:county]
    well.surface_casing_depth = form.render[:surface_casing_depth]
    well.production_casing_depth = form.render[:production_casing_depth]
    well.cement_top = form.render[:cement_top]
    well.tubing_depth = form.render[:tubing_depth]
    well.surface_casing_notes = form.render[:surface_casing_notes]
    well.prod_casing_notes = form.render[:prod_casing_notes]
    well.meter_type = form.render[:meter_type]
    well.current_meter_orfice_size = form.render[:current_meter_orfice_size]
    well.person_assigned = form.render[:person_assigned]

    Well.save_all
    open WellsScreen
  end

  def find_sales_group_id(sales_group)
    sg = SalesGroup.where(:name).eq(sales_group).first
    @sg = sg.id.to_i
  end
end