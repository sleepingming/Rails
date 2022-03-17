class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[show edit update destroy]

  def show
    @badge = Badge.find(params[:id])
  end

  def edit;end

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def update
    if @badge.update(badge_params)
      redirect_to [:admin, @badge]
    else
      render :edit
    end
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path(@badge)
    else
      render :new
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def set_badges
    @badges = Badge.all
  end

  def badge_params
    params.require(:badge).permit(:title, :image_url, :rule, :parameter)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end
end
