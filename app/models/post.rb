class Post < ApplicationRecord
  belongs_to :user, foreign_key: :author
  validates :text, presence: true
end
