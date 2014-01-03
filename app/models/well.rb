class Well
  include MotionModel::Model
  include MotionModel::ArrayModelAdapter
  include MotionModel::Validatable
  include MotionModel::Formotion

  columns sales_group_id: :integer,
          name: :string, 
          api_permit_num: :string, 
          operator: :string,
          sales_group_id: :integer,
          lat: :float,
          lon: :float,
          state: :string,
          township: :string,
          country: :string,
          surface_casing_depth: :integer,
          production_casing_depth: :integer,
          cement_top: :string,
          tubing_depth: :integer,
          surface_casing_notes: :string,
          prod_casing_notes: :string,
          meter_type: :string,
          current_meter_orfice_size: :string,
          person_assigned: :string

  has_many :well_drillings, :dependent => :destroy
  has_many :well_productions, :dependent => :destroy
  has_many :well_mechs, :dependent => :destroy
  belongs_to :sales_group
end