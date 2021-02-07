class Post < ApplicationRecord
  belongs_to :user, foreign_key: :author, optional: true
  validates :text, presence: true
end
