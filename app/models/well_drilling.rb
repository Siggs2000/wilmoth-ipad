class WellDrilling
  include MotionModel::Model
  include MotionModel::ArrayModelAdapter
  include MotionModel::Validatable
  include MotionModel::Formotion

  columns well_id: :integer, 
          report_notes: :string

  belongs_to :well

  def self.load_all
    WellDrilling.deserialize_from_file('well_drilling.dat')
  end


  def self.save_all
    WellDrilling.serialize_to_file('well_drilling.dat')
  end  
end