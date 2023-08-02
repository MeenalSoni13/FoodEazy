# require 'mailcatcher'
class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: "Access denied. You don't have permission to perform this action."
    end
end
