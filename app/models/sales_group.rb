class SalesGroup
  include MotionModel::Model
  include MotionModel::ArrayModelAdapter
  include MotionModel::Validatable
  include MotionModel::Formotion

  columns name: :string, 
          state: :string,
          county: :string,
          township: :string

  has_many :wells
end