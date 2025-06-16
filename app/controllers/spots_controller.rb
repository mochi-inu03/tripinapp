class SpotsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @spots = Spot.order(created_at: :desc) 

    @categories = Category.all 
  end
  
  def new
    @spot = Spot.new
  end

  def create
    @spot = current_user.spots.new(spot_params)
    if @spot.save
      redirect_to root_path, notice: 'スポットを投稿しました'
    else
      render :new
    end
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def destroy
    @spot = Spot.find(params[:id])
    if @spot.user == current_user
      @spot.destroy
      redirect_to spots_path, notice: '投稿を削除しました'
    else
      redirect_to spots_path, alert: '削除する権限がありません'
    end
  end

  def edit
    @spot = Spot.find(params[:id])
    redirect_to spots_path, alert: "編集する権限がありません" unless @spot.user == current_user
  end
  
  def update
    @spot = Spot.find(params[:id])
    if @spot.user == current_user && @spot.update(spot_params)
      redirect_to spot_path(@spot), notice: "スポットを更新しました"
    else
      render :edit, alert: "更新できませんでした"
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:title, :description, :image, :category_id, :latitude, :longitude)
  end
end
