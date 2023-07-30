# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def index
    UserMailer.example(User.new(email: 'bo@samurails.com')).deliver
    @users = User.all
  end
end
