class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session,
                       if: Proc.new { |c| c.request.format =~ %r{application/json} }
  def after_sign_in_path_for(resource)
    home_path
  end

  def decline_access
    redirect_to home_path
    return false
  end

end
