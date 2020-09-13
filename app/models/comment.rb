class Comment < ApplicationRecord
	belongs_to :post

	validates :post_id,   presence: true
	validates :desc,   presence: true
end
