class GoodsController < ApplicationController
  def index
  end

  def new
    
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :items_explanation, :category_id, :status_id, :price, :payment_id, :prefecture_id, :delivery_id).merge( user_id: current_user.id)
  end
end
