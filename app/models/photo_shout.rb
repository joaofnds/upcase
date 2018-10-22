class PhotoShout < ApplicationRecord
  has_one :shout
	has_one_attached :image
end
