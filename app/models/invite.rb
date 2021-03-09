class Invite < ApplicationRecord
  validates :email, presence: true, uniqueness: true, email: true
  validates :name, :tg, presence: true
end
