class Test < ActiveRecord::Base
   has_one :grade
   validates :topic, presence: true
end