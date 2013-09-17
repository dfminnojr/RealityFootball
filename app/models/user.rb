class User < ActiveRecord::Base

  attr_accessible :username, :email, :password, :password_confirmation, :password_digest, :picture, :rank, :point_amount, :provider, :uid, :avatar, :avatar_file_name, :admin


  has_attached_file :avatar,
    :styles => {:thumb => {:geometry => '75x75>', :format => :jpg},
    :original => {:geometry => '180x180>', :format => :jpg}},
    :storage => :s3,
    :s3_credentials => S3_CREDENTIALS,
    :path => ":attachment/:id/:style.:extension",
    :bucket => 'wdi-avatars.s3.amazonaws.com',
    :default_url => '/images/missing_:style.jpg'

  has_secure_password

  # omniAuth method for sessionscreate controller
  def self.create_with_omniauth(auth)
    create! do |user|
      user.email = auth["extra"]["raw_info"]["email"]
      user.username = auth["info"]["nickname"]
      user.password_digest = SecureRandom.urlsafe_base64
      user.password = auth["credentials"]["token"]
      user.password_confirmation = auth["credentials"]["token"]
      user.provider = auth["provider"]
      user.email = auth["uid"]
      user.uid = auth["uid"]
      user.picture = "http://graph.facebook.com/#{auth["uid"]}/picture?type=large"
      user.rank = "Pop Warner"
    end
  end

  has_one :bank
  has_many :wagers
  has_many :participations
  has_many :games, :through => :participations
  accepts_nested_attributes_for :participations


  # validates_attachment_presence :avatar
  # validates_attachment_size :avatar, :less_than => 3.megabytes


  before_save { |user| user.email = user.email.downcase }
  before_save :create_remember_token

  before_create validates :password_confirmation, presence: true
  before_create validates :password, length: { minimum: 6 }
  before_create validates_presence_of :email, :username, :password
  validates_uniqueness_of :email


  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  # VALID_USERNAME_REGEX = /^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$/
  # validates :username,  presence: true, format: {with: VALID_USERNAME_REGEX }, length: { maximum: 15 }, uniqueness: true


  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
