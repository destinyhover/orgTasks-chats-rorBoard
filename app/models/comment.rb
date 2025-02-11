class Comment < ApplicationRecord
  validates :author, presence: true
  validates :body, presence: true
  validates :body, length: { in: 10..4000 }

  belongs_to :article
end
