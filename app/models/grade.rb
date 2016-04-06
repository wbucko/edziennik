class Grade < ActiveRecord::Base
  belongs_to :user
  belongs_to :test
  validates :user_id, :test_id, :result, presence: true
  validates :user_id, uniqueness: { scope: :test_id }
end