class Assignment
  include Mongoid::Document
  
  belongs_to :lecture
  has_many: uploads, as: :uploadable
  
  field :date, type: Timestamp
  field :text, type: String
end
