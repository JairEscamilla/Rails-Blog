class HomeController < ApplicationController
  before_action :authenticate_user!
  def index # yarn add bootstrap para agregar bootstrap
  end
end
