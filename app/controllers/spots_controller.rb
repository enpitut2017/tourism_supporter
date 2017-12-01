class SpotsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  def index
    @spots = Spot.search(params[:search])
    search
  end

  def show
    @spot = Spot.find(params[:id])
    @sort_by = params[:sort_by];
    case @sort_by
    when "new"
      @advices = @spot.advices.order(created_at: :desc)
    else
      @advices = @spot.advices.order(likes_count: :desc)
    end
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = current_user.spots.build(spot_params)
    if @spot.save
      flash[:success] = "スポット作成ができました"
      redirect_to @spot
    else
      if params[:spot][:place_name].blank?
        flash.now[:danger] = "スポット名を入力してください"
      end
      if params[:spot][:lat].blank? || params[:spot][:lng].blank?
        flash.now[:warning] = "位置情報を入力してください"
      end
      render 'new'
    end
  end

private
  def spot_params
    params.require(:spot).permit(:place_name, :lat, :lng, :detail_comment)
  end

  def search
    if params[:lat].present? && params[:lng].present?
      @spots = @spots.within(params[:distance], :origin => [params[:lat], params[:lng]])
    end
  end

end
