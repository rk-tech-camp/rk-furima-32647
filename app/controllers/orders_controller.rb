class OrdersController < ApplicationController
  before_action :authenticate_user!
 
  def index
    @item = Item.find(params[:item_id])
    @order_adress = OrderAdress.new
  end

  def new
    @order_adress = OrderAdress.new
    
  end


  def create

    @order_adress = OrderAdress.new(order_address_params)
    if @order_adress.valid?
      @order_adress.save
      redirect_to action: :index
    else
      render action: :new
    end
   


    #@address = Address.new(address_params)
   # @address.save
    #@order = Order.new(order_params)
    #@order.save
    #バリデーションが分散すること
    #コントローラーの記述が長くなる


    #@order_address = OrderAddress.new(order_address_params)
    #@order_address.save
  end



  private
  def order_address_params
    #郵便番号とか電話番号とかの情報を受け取る + 購入したユーザーと商品の情報を受け取る
    params.require(:address,:order).permit( :postal , :region_id , :city , :number, :build,:phone, ).merge(user_id: current_user.id,item_id: item.id)
  end
  

  def address_params
    #郵便番号とか電話番号とかの情報を受け取る
  end

  def order_params
    #購入したユーザーと商品の情報を受け取る
  end

end


