class User
  include Mongoid::Document
  
  has_many :uploads
  has_many :courses
  
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
end
