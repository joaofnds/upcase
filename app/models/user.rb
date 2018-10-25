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
  has_many :following_relationships, foreign_key: :follower_id
  has_many :followeds, through: :following_relationships

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
