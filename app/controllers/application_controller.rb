class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(cars_path)
  end

  private

  def instance_image_path(picture, options = {})
    if picture.attached?
      cl_image_path picture.key, options
    else
      image_path "no-picture.png", options
    end
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
