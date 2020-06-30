class Article < ApplicationRecord
	with_options presence: true do
	  	validates :title
	  	validates :body
	  	validates :member_id
	  	validates :category_id
	end

	belongs_to :member
end