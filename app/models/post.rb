class Post < ApplicationRecord
  belongs_to :user, optional: true, foreign_key: :author
  belongs_to :admin_user, optional: true, foreign_key: :moderator
  validates :text, presence: { message: "без текста низзя" }
  validate :is_json?

  scope :approved, -> { where(approved: true) }

  before_save do
    self.published_at = Time.current if self.published_at.blank?
  end

  def get_author
   self.user.present? ? self.user.email : self.signature
  end

  def is_json?
    return true if self.attachments.blank?
    raise JSON::ParserError.new "Attachments must be array of json" unless JSON.parse(self.attachments).class == Array
  end
end
