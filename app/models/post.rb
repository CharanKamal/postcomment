class Post < ApplicationRecord
	validates :post, presence: true

	has_many :comments, dependent: :destroy
	has_many :likes, as: :likeable, dependent: :destroy
end