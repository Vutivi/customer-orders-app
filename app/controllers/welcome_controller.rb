class WelcomeController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "secret"
  def index
	  @orders = Order.all
  end
end
