class ItemsController < ApplicationController
	
	def index
		@items = Item.includes(:user)
		
	end

	def new
		@item = Item.new
		

		
	end

	def create
		 @item = Item.new(item_params)
		 if @item.save
			redirect_to root_path
		else  
			render :new
		end		
		 
		
	end

end



	private
	
	def item_params
    params.require(:item).permit(:item_name,:item_note,:price,:image ,:genre_id, :status_id, :charge_id, :region_id, :shipping_id ,).merge(user_id: current_user.id)
  end

