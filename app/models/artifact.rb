class Artifact < ApplicationRecord
  validate :is_json?, :valid_category
  has_one_attached :attachment, dependent: :destroy

  def url
    self.attachment.url
  end

  def self.possible_categories
    %w(video ad post photo)
  end

  protected

  def valid_category
    raise ActiveRecord::RecordInvalid.new unless Artifact.possible_categories.include?(self.category)
  end

  def is_json?
    return true unless self.additional.present?
    raise JSON::ParserError.new "additional must be json-string" unless self.additional.class == String
    begin
      !!JSON.parse(self.additional)
    rescue => exception
      errors.add(:additional, "Здесь жсон должен быть, ало")
    end
  end
end
