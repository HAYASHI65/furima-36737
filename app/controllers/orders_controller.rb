class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_object = OrderObject.new
  end

  def create
    @order_object = OrderObject.new(order_params)
    if @order_object.valid?
      @order_object.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_object).permit(:post_code, :prefecture_id, :city, :block, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
