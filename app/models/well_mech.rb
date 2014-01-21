class WellMech
  include MotionModel::Model
  include MotionModel::ArrayModelAdapter
  include MotionModel::Validatable
  include MotionModel::Formotion

  columns well_id: :integer, 
          production_casing_ann_pressure: :string,
          production_casing_ann_status: :string,
          water_level_measurement: :string,
          production_casing_ann_open_flow: :string,
          gas_escaping: :string,
          evidence_of_corrosion: :boolean

  belongs_to :well

  def self.load_all
    WellMech.deserialize_from_file('well_mech.dat')
  end


  def self.save_all
    WellMech.serialize_to_file('well_mech.dat')
  end  
end