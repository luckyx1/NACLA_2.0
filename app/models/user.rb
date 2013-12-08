class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation
  attr_accessor :password
  before_save :encrypt_password

  has_many :course_packs
  has_many :comments


  validates_confirmation_of :password
  validates_presence_of :password
  validates_presence_of :email, :on => :create
  validates_presence_of :username, :on => :create
  validates_uniqueness_of :email
  validates_uniqueness_of :username

  def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.get_names(ids)

    user_names = {}

    ids.each do |id|
      user_names[id] = User.find(id).username
    end

    return user_names

  end
end
