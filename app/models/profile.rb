class Profile < ApplicationRecord
  SEXES = ["", "Male", "Female"]
  belongs_to :user
  has_one :photo, dependent: :destroy, inverse_of: :profile
  has_many :sender_profile_likes, class_name: "Like", foreign_key: "sender_profile_id"
  has_many :receiver_profile_likes, class_name: "Like", foreign_key: "receiver_profile_id"
  has_one :search_preference

  after_create :create_photo, :create_search_preference

  accepts_nested_attributes_for :photo

  def complete?
    self.sex.present? && self.description.present? && self.name.present? && self.photo.file.attached?
  end

  def age
    self.user.age
  end

  def full_name
    "#{self.name}, #{self.age}"
  end
end
