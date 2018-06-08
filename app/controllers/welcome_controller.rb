class WelcomeController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "secret"
  def index
	
  end
end
