class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  ROLES = %w[user admin]

  # Проверяет, является ли пользователь администратором
  def admin?
    role == "admin"
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

  has_many :articles
  has_many :assigned_articles, class_name: "Article", foreign_key: "assigned_user_id"
end
