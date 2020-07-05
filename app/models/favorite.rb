class Favorite < ApplicationRecord
  belongs_to :member
  belongs_to :article

  with_options presence: true do
    validates :article_id
    validates :member_id
  end
end
