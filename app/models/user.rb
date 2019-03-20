class User < ApplicationRecord
  has_secure_password
  validates :full_name, uniqueness: { case_sensitive: false }

  belongs_to :mod
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :posts, through: :likes
end
