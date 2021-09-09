class OrdersController < ApplicationController

before_action :authenticate_user!
before_action :move_to_index

  def index
    @item = Item.find(params[:item_id])
    @order_object = OrderObject.new
  end

  def create
    @order_object = OrderObject.new(order_params)
    if @order_object.valid?
      pay_item
      @order_object.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def order_params
    params.require(:order_object).permit(:post_code, :prefecture_id, :city, :block, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(order_params[:item_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id != @item.user_id && @item.user_item
      redirect_to root_path
    end
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
