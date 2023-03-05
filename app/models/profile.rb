class Profile < ApplicationRecord
  belongs_to :user

  def complete?
    self.sex.present? && self.description.present? && self.name.present?
  end
end
