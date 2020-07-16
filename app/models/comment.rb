class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :article

  with_options presence: true do
    validates :content
  end
end
