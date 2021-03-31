class Invite < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true
  validates :tg, presence: true
  attr_accessor :email

  before_save do
    self.tg = self.tg.sub("@", "")
    self.tg.downcase!
  end

  scope :approved, -> { where(approved: true) }
end
