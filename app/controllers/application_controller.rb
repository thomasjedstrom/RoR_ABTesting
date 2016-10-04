class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  use_vanity :user_identity
  
  protected

  def user_identity
  	(0...8).map { (65 + rand(26)).chr }.join
  end
end
