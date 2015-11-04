class Profile < ActiveRecord::Base
    belongs_to :user
    validates :first_name, :last_name, :year, :email, presence: true
end