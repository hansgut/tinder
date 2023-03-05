class Profile < ApplicationRecord
  belongs_to :user
  has_one :photo, dependent: :destroy, inverse_of: :profile
  after_create :create_photo

  accepts_nested_attributes_for :photo

  def complete?
    self.sex.present? && self.description.present? && self.name.present?
  end
end
