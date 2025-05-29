class SpotsController < ApplicationController

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
  
  private

  def spot_params
    params.require(:spot).permit(:title, :description, :image, :category_id)
  end
end
