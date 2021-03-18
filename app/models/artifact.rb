class Artifact < ApplicationRecord
  validate :is_json?, :valid_category
  has_one_attached :attachment, dependent: :destroy
  has_one_attached :manual_preview, dependent: :destroy

  def url
    self.attachment.url
  end

  def preview
    return self.manual_preview.variant(resize_to_limit: [800,800]).processed.url if self.manual_preview.attached?
    self.attachment.preview(resize_to_limit: [800,800]).processed.url if self.attachment&.blob&.content_type == "video/mp4"
  end

  def self.possible_categories
    %w(video ad post photo sound joke)
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
