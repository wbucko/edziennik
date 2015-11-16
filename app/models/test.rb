class Test < ActiveRecord::Base
   has_one :grade, dependent: :destroy
   validates :topic, presence: true, uniqueness: true
   
end