class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	use_vanity :user_identity

	after_filter :set_header_for_iframe

	private
	def set_header_for_iframe
		response.headers.delete "X-Frame-Options" 
	end

	protected

	def user_identity
		(0...8).map { (65 + rand(26)).chr }.join
	end
end
