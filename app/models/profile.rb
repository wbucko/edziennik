class Profile < ActiveRecord::Base
  belongs_to :user
  validates :first_name, :last_name, :year, presence: true
  validates :avatar, attachment_presence: true
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes
  validates :year, inclusion: 1..4
    
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" },
    :default_url => "/images/:style/missing.png",
    :url  => ":s3_domain_url",
    :path => "public/avatars/:id/:style_:basename.:extension",
    :storage => :fog,
    :fog_credentials => {
        provider: 'AWS',
        aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
        aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    },
    fog_directory: ENV['FOG_DIRECTORY']
                      
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def to_s
    "#{first_name} #{last_name}"
  end
end

