class HomeController < ApplicationController
  def index
    @likes_count = Like.where(receiver_profile_id: current_profile)
                 .where.not(sender_profile_id: Match.matched_profile_ids(current_profile.id)).count
  end
end
