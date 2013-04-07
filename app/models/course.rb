class Course
  include Mongoid::Document
  
  has_many :users
  has_many :lectures
  
  field :name, type: String
  field :course_number, type: String
  field :instructor, type: String
end
