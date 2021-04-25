class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:use_id, :item_id, :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :tel_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end