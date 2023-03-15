class MatchesController < ApplicationController
  def index
    @profile_id = current_profile.id
    @matches = Match.profiles_matches(@profile_id)
    @pairs = @matches.map do |match|
      match.pair_profile(@profile_id)
    end
  end

  def show
    @profile_id = current_profile.id
    @matches = Match.profiles_matches(@profile_id)
    @pairs = @matches.map do |match|
      match.pair_profile(@profile_id)
    end
    @match = Match.find(params[:id])
    render :index
  end
end
