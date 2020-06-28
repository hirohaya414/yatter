class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image

  with_options presence: true do
  	validates :name
  	validates :school_year
  end

  has_many :articles, dependent: :destroy
end
