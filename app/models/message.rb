class Message < ApplicationRecord
  belongs_to :profile
  belongs_to :match

  validates :content, presence: true

  after_commit on: :create do
    broadcast_append_to(
      match,
      partial: "messages/message",
      locals: { message: self },
      target: "messages"
    )
  end

  def from_me?(current_profile_id)
    profile_id == current_profile_id
  end
end
