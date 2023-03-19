class SearchPreference < ApplicationRecord
  belongs_to :profile

  validates :min_age, numericality: { greater_than_or_equal_to: 18, less_than_or_equal_to: :max_age }
  validates :max_age, numericality: { greater_than_or_equal_to: :min_age, less_than_or_equal_to: 100 }
end
