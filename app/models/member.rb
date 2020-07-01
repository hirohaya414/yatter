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
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  enum school_year: {
    # middle=中学、first_year=高校１年、second_year=高校２年、third_year=高校３年、others=その他
    middle: 0, first_year: 1, second_year: 2, third_year: 3, others: 4
  }
end
