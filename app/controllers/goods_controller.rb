class GoodsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @goods = Good.all.order('created_at DESC')
  end

  def show
    @goods = Good.find(params[:id])
  end

  def new
    @goods = Good.new
  end

  def create
    @goods = Good.new(good_params)
    if @goods.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def good_params
    params.require(:good).permit(:image, :items_name, :items_explanation, :category_id, :status_id, :price, :payment_id, :prefecture_id,
                                 :delivery_id).merge(user_id: current_user.id)
  end
end
