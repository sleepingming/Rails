class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  def redirect_after_sign_in(user)
    if user.is_a?(Admin)
      admin_tests_path
    end
  end
end
