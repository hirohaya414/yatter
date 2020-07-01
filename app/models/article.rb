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
	has_many :favorites, dependent: :destroy

	def favorited_by?(member)
	favorites.where(member_id: member.id).exists?
	end
end
