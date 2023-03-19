class SearchPreferencesController < ApplicationController
  before_action :set_search_preference

  def edit
  end

  def update
    if @search_preference.update(search_preference_params)
      redirect_to "/"
    else
      render "edit"
    end
  end

  private

  def search_preference_params
    params.require(:search_preference).permit(:min_age, :max_age, :sex)
  end

  def set_search_preference
    @search_preference = current_profile.search_preference
  end
end
