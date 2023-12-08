class LandingController < ApplicationController

  def show
    render({ :template => "landing/show" })
  end

end
