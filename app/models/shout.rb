class Shout < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :content, polymorphic: true, required: true

  default_scope { order(created_at: :desc) }

  delegate :username, to: :user
end
