class LikesController < ApplicationController
  before_action :likes_params, only: :create

  def create
    if Like.create(likes_params)
      redirect_to "index#search"
    else
      render "search/index"
    end
  end

  def likes_params
    params.require(:like).permit(:receiver_profile_id, :sender_profile_id)
  end
end
