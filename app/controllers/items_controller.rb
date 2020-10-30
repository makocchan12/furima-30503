class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:create, :show, :edit, :update]
  before_action :move_to_root, only: [:edit]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
   
   
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_charge_payer_id, :prefecture_id, :day_required_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_root
    unless current_user == @item.user
      redirect_to root_path
    end
  end
end
