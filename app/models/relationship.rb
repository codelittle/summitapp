class Relationship < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :coach, class_name: "User"
  validates :user_id, presence: true
  validates :coach_id, presence: true
end