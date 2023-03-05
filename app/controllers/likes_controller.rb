class LikesController < ApplicationController
  before_action :likes_params, only: :create

  def index
    # TODO: except matches in future
    @likes = Like.where(receiver_profile_id: current_profile)
                 .where.not(sender_profile_id: Match.matched_profile_ids(current_profile.id))
  end

  def create
    if Like.create(likes_params)
      redirect_to "index#search"
    else
      render "search/index"
    end
  end

  private

  def likes_params
    params.require(:like).permit(:receiver_profile_id, :sender_profile_id)
  end
end
