class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :type, presence: true

  has_many :comments, dependent: :destroy
end
