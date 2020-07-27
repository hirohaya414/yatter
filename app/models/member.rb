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

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :following_member, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_member, through: :followed, source: :follower # 自分をフォローしている人

  def follow(member_id)
    follower.create(followed_id: member_id)
  end

  # ユーザーのフォローを外す
  def unfollow(member_id)
    follower.find_by(followed_id: member_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(member)
    following_member.include?(member)
  end

  enum school_year: {
    # middle=中学、first_year=高校１年、second_year=高校２年、third_year=高校３年、others=その他
    middle: 0, first_year: 1, second_year: 2, third_year: 3, others: 4
  }

  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end
