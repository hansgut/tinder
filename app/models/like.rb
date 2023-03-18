class Like < ApplicationRecord
  belongs_to :sender_profile, class_name: "Profile"
  belongs_to :receiver_profile, class_name: "Profile"

  def self.get_sent(profile)
    Like.where(sender_profile: profile)
  end

  def match?
    Like.where(receiver_profile_id: self.sender_profile_id, sender_profile_id: self.receiver_profile_id, dislike: false).exists?
  end

  def build_match
    Match.create(profile1_id: self.receiver_profile_id, profile2_id: self.sender_profile_id)
  end
end
