class Artifact < ApplicationRecord
  validate :additional, :is_json?

  protected

  def is_json?
    !!JSON.parse(self.additional)
  end
end
