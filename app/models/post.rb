class Post < ApplicationRecord
  belongs_to :user, optional: true, foreign_key: :author
  belongs_to :admin_user, optional: true, foreign_key: :moderator
  validates :text, presence: true

scope :approved, -> { where(approved: true) }
end
