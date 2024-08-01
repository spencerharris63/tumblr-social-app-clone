class User < ApplicationRecord
  has_many :subscriptions, foreign_key: :follower_id, dependent: :destroy
  has_many :leaders, through: :subscriptions, source: :leader
  has_many :reverse_subscriptions, foreign_key: :leader_id, class_name: 'Subscription', dependent: :destroy
  has_many :followers, through: :reverse_subscriptions
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :text_posts, dependent: :destroy
  has_many :image_posts, dependent: :destroy

  # Adding secure password and email validation
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def following?(leader)
    leaders.include?(leader)
  end

  def follow!(leader)
    unless leader == self || following?(leader)
      subscriptions.create!(leader_id: leader.id)
    end
  end

  def unfollow!(leader)
    subscriptions.find_by(leader_id: leader.id).destroy
  end

  def timeline_user_ids
    leader_ids + [id]
  end
end