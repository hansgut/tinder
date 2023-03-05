class Like < ApplicationRecord
  belongs_to :sender_profile, class_name: "Profile"
  belongs_to :receiver_profile, class_name: "Profile"

  def self.get_sent(current_user)
    Like.where(sender_profile: current_user.profile)
  end
end
