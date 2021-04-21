class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @item = Item.new
  end

  def create
   @item = Item.new(item_params)
    if @item.save
     redirect_to root_path      
    else
     render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :item_status_id, :delivery_charge_burden_id, :prefectures_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

end