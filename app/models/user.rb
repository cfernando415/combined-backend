class User < ApplicationRecord
  has_secure_password
  validates :full_name, uniqueness: { case_sensitive: false }

  belongs_to :mod
  has_many :cposts, class_name: "Post", foreign_key: "user_id", dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :lposts, through: :likes
end
