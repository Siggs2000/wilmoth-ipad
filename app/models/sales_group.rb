class SalesGroup
  include MotionModel::Model
  include MotionModel::ArrayModelAdapter
  include MotionModel::Validatable
  include MotionModel::Formotion

  columns name: :string, 
          state: :string,
          county: :string,
          township: :string,
          api_id: :integer

  has_many :wells

  def self.load_all
    SalesGroup.deserialize_from_file('sales_group.dat')
  end


  def self.save_all
    SalesGroup.serialize_to_file('sales_group.dat')
  end  
end