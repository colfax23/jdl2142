class Upload
  include Mongoid::Document
  
  belongs_to :user
  belongs_to : uploadable, polymorphic: true
  
  
  field :file, type: Binary
  field :date, type: Timestamp
  field :grade, type: Integer
end
