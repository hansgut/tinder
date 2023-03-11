class ProfilesController < ApplicationController
  before_action :set_profile
  before_action :profile_params, only: :update

  def edit
    @disable_nav = true
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
    params.require(:profile).permit(:name, :sex, :description, photo_attributes: [:id, :file])
  end

  def set_profile
    @profile = current_profile
  end
end
