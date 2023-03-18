class LikesController < ApplicationController
  before_action :likes_params, only: :create

  def index
    # TODO: except matches in future
    @likes = Like.where(receiver_profile_id: current_profile)
                 .where.not(sender_profile_id: Match.matched_profile_ids(current_profile.id))
  end

  def create
    @like = Like.new(likes_params)
    if @like.save
      if @like.match?
        @like.build_match
      end
      render json: { like: @like, match: @like.match? }
    else
      render json: { errors: @like.errors }
    end
  end

  def dislike
    @dislike = Like.new(likes_params.merge(dislike: true))
    if @dislike.save
      render json: { like: @dislike, match: @dislike.match? }
    else
      render json: { errors: @dislike.errors }
    end
  end

  private

  def likes_params
    params.require(:like).permit(:receiver_profile_id).merge(sender_profile_id: current_profile.id)
  end
end
