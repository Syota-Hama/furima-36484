class OrdersController < ApplicationController
  before_action :get_good, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipalitis, :address, :telephone_number, :building_name).merge(price: @good.price,user_id: current_user.id, good_id: @good.id, token: params[:token])
  end

  def get_good
    @good = Good.find(params[:good_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: order_params[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
