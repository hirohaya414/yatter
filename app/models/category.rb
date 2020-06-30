class Category < ApplicationRecord
	validates :name, presence: true
	validates :is_invalid, inclusion: { in: [true, false] }
	has_many :articles
end
