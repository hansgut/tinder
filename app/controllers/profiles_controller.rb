class ProfilesController < ApplicationController
  before_action :set_profile
  before_action :profile_params, only: :update

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to "/"
    else
      render "edit"
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :sex, :description)
  end

  def set_profile
    @profile = current_user.profile
  end
end
