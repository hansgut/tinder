class MessagesController < ApplicationController
  before_action :set_match, only: [:create]

  def create
    @match.messages.create(message_params)

    redirect_to @match
  end

  private

  def set_match
    @match = Match.find(params[:match_id])
  end

  def message_params
    params.require(:message).permit(:content).merge(profile_id: current_profile.id)
  end
end
