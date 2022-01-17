class OrdersController < ApplicationController
  def index
    @good = Good.find(params[:good_id])
    @order_address = OrderAddress.new
  end

  def create
    @good = Good.find(params[:good_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipalitis, :address, :telephone_number, :building_name).merge(user_id: current_user.id, good_id: @good.id, token: params[:token])
  end
end
