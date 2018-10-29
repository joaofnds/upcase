class ShoutSearchQuery
  def initialize(term:)
    @term = term
  end

  def to_relation
    matching_shouts_for_text_shouts.or(matching_shouts_for_photo_shouts)
  end

  # private

  attr_reader :term

  def matching_shouts_for_text_shouts
    Shout.where(content_type: "TextShout", content_id: matching_text_shouts.pluck(:id))
  end

  def matching_text_shouts
    TextShout.where("body LIKE ?", "%#{term}%")
  end

  def matching_shouts_for_photo_shouts
    Shout.where(content_type: "PhotoShout", content_id: matching_photo_shouts.pluck(:id))
  end

  def matching_photo_shouts
    PhotoShout.
      joins("LEFT JOIN active_storage_attachments AS attachments ON attachments.record_type = 'PhotoShout' AND attachments.record_id::BIGINT = photo_shouts.id").
      joins("LEFT JOIN active_storage_blobs AS blobs ON blobs.id = attachments.blob_id WHERE blobs.filename LIKE '%#{term}%'")
  end
end
