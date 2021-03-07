class Artifact < ApplicationRecord
  validate :is_json?
  has_one_attached :attachment

  protected

  def is_json?
    return true unless self.additional.present?
    raise JSON::ParserError.new "additional must be json-string" unless self.additional.class == String
  end
end
