class Lecture
  include Mongoid::Document
  
  belongs_to :course
  has_many :assignments
  has_many: uploads, as: :uploadable
  
  field :number, type: Integer
  field :date, type: Timestamp
end
