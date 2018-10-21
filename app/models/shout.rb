class Shout < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true

  validates_presence_of :user

  default_scope { order(created_at: :desc) }

  delegate :username, to: :user
end
