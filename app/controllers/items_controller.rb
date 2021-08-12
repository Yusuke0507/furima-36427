class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order(id: "DESC" )
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

  def show
  end

  def edit
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path, method: :get
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :detail, :price, :image, :category_id, :status_id, :shipping_fee_id, :area_id, :days_to_ship_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end