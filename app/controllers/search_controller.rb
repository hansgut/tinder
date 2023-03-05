class SearchController < ApplicationController
  def index
    # TODO: preferences to search
    @profiles = Profile.where.not(id: current_user.profile)
  end
end
