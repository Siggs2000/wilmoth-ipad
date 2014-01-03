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
          notes: :string

  belongs_to :well
end