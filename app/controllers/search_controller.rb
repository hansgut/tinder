class SearchController < ApplicationController
  def index
    profile_ids = Like.get_sent(current_profile).pluck(:receiver_profile_id)
    @preferences = current_profile.search_preference
    @profiles = Profile.joins("inner join users on users.id = profiles.user_id")
                       .where("age(users.birthday) between interval '? years' and interval '? years'",
                              @preferences.min_age, @preferences.max_age)
                       .where.not(id: profile_ids << current_profile.id)
    @profiles = @profiles.where(sex: @preferences.sex) if @preferences.sex.present?
  end

  def send_like
    Like.new(receiver_profile_id: params[:receiver_profile_id], sender_profile_id: current_profile)
  end
end
