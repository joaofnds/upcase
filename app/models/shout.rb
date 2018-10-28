class Shout < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :content, polymorphic: true, required: true

  delegate :username, to: :user
end
