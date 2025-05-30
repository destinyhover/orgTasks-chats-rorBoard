class Article < ApplicationRecord
  enum :status, { in_progress: 0, completed: 1 }, default: :in_progress
  validates :title, presence: true, length: { in: 10..140 }
  validates :text, presence: true, length: { in: 10..4000 }

  has_many :comments
  belongs_to :user
  belongs_to :assigned_user, class_name: "User", optional: true  # Исполнитель
  def subject
    title
    
  end

  def last_comment
    comments.last
    
  end
end
