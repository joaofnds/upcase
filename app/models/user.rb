class User < ApplicationRecord
  include Clearance::User

  validates :username,
            presence: true,
            uniqueness: true

  has_many :shouts, dependent: :destroy
  has_many :likes
  has_many :liked_shouts,
           through: :likes,
           source: :shout

  has_many :followeds_relationship,
           foreign_key: :follower_id,
           class_name: "FollowingRelationship",
           dependent: :destroy
  has_many :followeds, through: :followeds_relationship

  has_many :followers_relationships,
           foreign_key: :followed_id,
           class_name: "FollowingRelationship",
           dependent: :destroy
  has_many :followers, through: :followers_relationships

  def timeline_shouts
    Shout.where(user_id: followed_ids + [id])
  end

  def like(shout)
    liked_shouts << shout
  end

  def unlike(shout)
    liked_shouts.destroy(shout)
  end

  def liked?(shout)
    liked_shouts.include?(shout)
  end

  def follow(user)
    followeds << user
  end

  def unfollow(user)
    followeds.destroy(user)
  end
  
  def following?(user)
    followeds.include?(user)
  end

  def to_param
    username
  end
end
