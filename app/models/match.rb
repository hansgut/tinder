class Match < ApplicationRecord
  belongs_to :profile1, class_name: "Profile"
  belongs_to :profile2, class_name: "Profile"
  has_many :messages, dependent: :destroy

  def self.profiles_matches(profile_id)
    Match.where("profile1_id = #{profile_id} or profile2_id = #{profile_id}")
  end

  def self.matched_profile_ids(profile_id)
    self.profiles_matches(profile_id).map do |match|
      match.profile1_id == profile_id ? match.profile2_id : match.profile1_id
    end
  end

  def pair_profile(current_profile_id)
    if self.profile1_id == current_profile_id
      self.profile2
    else
      self.profile1
    end
  end
end
