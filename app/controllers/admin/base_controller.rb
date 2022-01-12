class Admin::BaseController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: 'Вы не можете просмотреть эту страницу' unless current_user.admin?(current_user)
  end
end
