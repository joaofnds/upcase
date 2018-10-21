class Shout < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { in: 1..144 }
  validates_presence_of :user

  default_scope { order(created_at: :desc) }

  delegate :username, to: :user
end
