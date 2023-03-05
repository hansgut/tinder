class MatchesController < ApplicationController
  def index
    @profile_id = current_profile.id
    @matches = Match.profiles_matches(@profile_id)
  end
end
