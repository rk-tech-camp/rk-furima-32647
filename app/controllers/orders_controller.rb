class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :contributor_confirmation

  def index
  

    redirect_to root_path unless @item.order.nil?

    @order_address = OrderAddress.new
  end

  def create
    binding.pry
   
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?

      pay_item

      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_address_params              # 郵便番号とか電話番号とかの情報を受け取る + 購入したユーザーと商品の情報を受け取る
    params.require(:order_address).permit(:postal, :region_id, :city, :number, :build, :phone).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
    
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end

  def contributor_confirmation
    unless user_signed_in?
      redirect_to root_path
		end
  end
end
