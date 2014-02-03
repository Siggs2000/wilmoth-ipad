class WellProduction
  include MotionModel::Model
  include MotionModel::ArrayModelAdapter
  include MotionModel::Validatable
  include MotionModel::Formotion

  columns well_id: :integer, 
          current_status: :string, 
          casing_pressure: :string,
          tubing_pressure: :string,
          line_pressure: :string,
          item_added: :string,
          quantity_items_added: :integer,
          operation_conducted: :string,
          current_production: :string,
          water_tank_level: :string,
          notes: :string,
          created_at: :date

  belongs_to :well

  def self.load_all
    WellProduction.deserialize_from_file('well_production.dat')
  end


  def self.save_all
    WellProduction.serialize_to_file('well_production.dat')
  end  
end