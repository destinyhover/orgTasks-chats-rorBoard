class Article < ApplicationRecord
  validates :title, presence: true, length: { in: 10..140 }
  validates :text, presence: true, length: { in: 10..4000 }
  has_many :comments
  belongs_to :user

  def subject
    title
    
  end

  def last_comment
    comments.last
    
  end
end
