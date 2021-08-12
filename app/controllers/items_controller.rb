class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :detail, :price, :image, :category_id, :status_id, :shipping_fee_id, :area_id, :days_to_ship_id).merge(user_id: current_user.id)
  end
end