class SearchController < ApplicationController
  def index
    # TODO: preferences to search

    profile_ids = Like.get_sent(current_user).pluck(:receiver_profile_id)

    @profiles = Profile.where.not(id: profile_ids << current_user.profile)
  end

  def send_like
    Like.new(receiver_profile_id: params[:receiver_profile_id], sender_profile_id: current_user.profile)
  end
end
