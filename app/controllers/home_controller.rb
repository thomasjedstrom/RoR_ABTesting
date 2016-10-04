class HomeController < ApplicationController
  def index
  end

  def test
  	puts "hey"
    Vanity.track! :first_test
    redirect_to root_path
  end
end
