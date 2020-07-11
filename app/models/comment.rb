class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :article

  with_options presence: true do
    validates :content
    validates :article_id
    validates :member_id
  end
end
