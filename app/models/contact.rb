class Contact < ApplicationRecord
  validates :email, presence: true
  validates :text, presence: true
end
