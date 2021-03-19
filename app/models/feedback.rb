class Feedback < ApplicationRecord
  validates :author, presence: true
  validates :osoboe_mnenie, presence: true
end
