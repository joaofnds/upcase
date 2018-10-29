class HashtagsController < ApplicationController
  def show
    @hashtag = params[:id]
    @shouts = Shout.
                joins("LEFT JOIN text_shouts ON content_type = 'TextShout' AND content_id::BIGINT = text_shouts.id").
                where("text_shouts.body LIKE ?", "%##{@hashtag}%")
  end
end
