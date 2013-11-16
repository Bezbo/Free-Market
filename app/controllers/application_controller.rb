class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to items_url, notice: exception.message
  end

end

