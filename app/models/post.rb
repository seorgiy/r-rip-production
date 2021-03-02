class Post < ApplicationRecord
  belongs_to :user, optional: true, foreign_key: :author
  belongs_to :admin_user, optional: true, foreign_key: :moderator
  validates :text, presence: true
  validate :attachments, :is_json?

  scope :approved, -> { where(approved: true) }

  def get_author
   self.user.present? ? self.user.email : self.signature
  end

  def is_json?
    !!JSON.parse(self.attachments)
  end
end
