class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @pagy, @movies = pagy(Movie.order(:rating).all)

    render
  end

end
