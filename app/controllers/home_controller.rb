class HomeController < ApplicationController
  # before_filter :skip_to_home_if_not_logged, :only => [:index]
  # before_filter :authenticate_user!
  def index
    if user_session
      redirect_to home_path
    end
  end
end