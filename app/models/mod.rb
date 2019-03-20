class Mod < ApplicationRecord
    has_many :users, dependent: :destroy
    has_many :posts, dependent: :destroy
end
