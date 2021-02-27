class Post < ApplicationRecord
  belongs_to :user, optional: true, foreign_key: :author
  belongs_to :admin_user, optional: true, foreign_key: :moderator
  validates :text, presence: true
  has_many_attached :attachments

  scope :approved, -> { where(approved: true) }

  def get_author
   self.user.present? ? self.user.email : self.signature
  end
end
