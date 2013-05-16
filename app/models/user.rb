class User
  include Mongoid::Document
  include ActiveModel::SecurePassword   
  
  has_many :uploads, as: :uploadable
  has_and_belongs_to_many :courses
  
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :role, type: String
  field :password_hash, type: String 
  field :password_salt, type: String
  field :password_digest, :type => String
  has_secure_password
   
  attr_accessible :email, :password, :password_confirmation
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  #he already had the presence validaiton of email
  validates_presence_of :email
  validates_uniqueness_of :email 
   
  before_save :default_values

  def default_values
    self.role ||= "student"
  end
   
  def self.find_by_email(email)
    where(:email => email).first
  end
   
  def self.authenticate(email, password)
    user = find_by(email: email)    
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      true
    else
      false
    end
  end 
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
    
end
