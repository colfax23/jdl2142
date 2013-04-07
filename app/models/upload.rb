class Upload
  include Mongoid::Document
  
  belongs_to :uploadable, polymorphic: true
  belongs_to :user
  
  field :file, type: Moped::BSON::Binary
  field :date, type: DateTime
  field :grade, type: Integer
end
