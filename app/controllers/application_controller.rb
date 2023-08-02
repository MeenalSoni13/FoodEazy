# require 'mailcatcher'
class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: "Access denied. You don't have permission to perform this action."
    end
end
