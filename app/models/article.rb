class Article < ApplicationRecord
	with_options presence: true do
	  	validates :title
	  	validates :body
	  	validates :member_id
	  	validates :category_id
	end

	belongs_to :member
	belongs_to :category
	has_many :comments, dependent: :destroy
end
