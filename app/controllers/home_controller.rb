class HomeController < ApplicationController
  def index
    @likes_count = Like.where(receiver_profile_id: current_profile)
                 .where.not(sender_profile_id: Match.matched_profile_ids(current_profile.id)).count
    @profile_id = current_profile.id
    @pairs = Match.profiles_matches(@profile_id).map do |match|
      match.pair_profile(@profile_id)
    end
  end
end
