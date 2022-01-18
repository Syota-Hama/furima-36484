class GoodsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :get_good, only: [:show, :edit, :update, :destroy]
  before_action :current_user?, only: [:edit, :destroy]
  before_action :get_order, only: [:index, :show]

  def index
    @goods = Good.all.order('created_at DESC')
  end

  def show
  end

  def edit
  end

  def update
    if @good.update(good_params)
      redirect_to good_path
    else
      render :edit
    end
  end

  def new
    @good = Good.new
  end

  def create
    @good = Good.new(good_params)
    if @good.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @good.destroy
    redirect_to root_path
    end

  private

  def get_good
    @good = Good.find(params[:id])
  end

  def get_order
    @order = Order.all
  end

  def current_user?
    if current_user.id == @good.user_id
    else
      redirect_to root_path
    end
  end

  def good_params
    params.require(:good).permit(:image, :items_name, :items_explanation, :category_id, :status_id, :price, :payment_id, :prefecture_id,
                                 :delivery_id).merge(user_id: current_user.id)
  end
end
