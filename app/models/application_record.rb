class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # def page(count)
  #   p count
  #   self.offset(20*count).limit(20).order(created_at: :desc)
  # end
end
