class SpotsController < ApplicationController
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
  
  private

  def spot_params
    params.require(:spot).permit(:title, :description, :image, :category_id)
  end
end
