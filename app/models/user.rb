class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile

  after_create :create_profile

  validates :birthday, presence: true
  validate :at_least_18?

  def age
    ((Time.zone.now - self.birthday.to_time) / 1.year.seconds).floor
  end

  def at_least_18?
    if self.birthday
      errors.add(:birthday, "You must be 18 years or older.") if age < 18
    end
  end
end
