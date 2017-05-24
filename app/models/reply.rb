class Reply < ApplicationRecord
	validates :reply, presence: true
  belongs_to :comment
  has_many :likes, as: :likeable, dependent: :destroy
  
end
