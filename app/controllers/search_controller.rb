class SearchController < ApplicationController
  def index
    # TODO: preferences to search

    profile_ids = Like.get_sent(current_profile).pluck(:receiver_profile_id)

    @profiles = Profile.where.not(id: profile_ids << current_profile.id)
  end

  def send_like
    Like.new(receiver_profile_id: params[:receiver_profile_id], sender_profile_id: current_profile)
  end
end
