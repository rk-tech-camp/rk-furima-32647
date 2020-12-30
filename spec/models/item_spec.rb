require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do

    context "商品の保存ができる場合" do
      


      it "記入欄全てが存在すれば録できる" do
        expect(@item).to be_valid
        
        
       


      end
      
    end


    context "商品の保存ができない場合" do

      it "画像がないと保存できない" do
        
        @item.image = nil
        @item.valid?
        

        expect(@item.errors.full_messages).to include("Image can't be blank")

      end     

      it "item_nameがないと保存できない" do
        
        @item.item_name = ""
        @item.valid?
       
        

        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end  

      it "item_noteがないと保存できない" do
        
          @item.item_note= ""
          @item.valid?
          
  
          expect(@item.errors.full_messages).to include("Item note can't be blank")
      end
      
      
      it 'genre_idが空では登録できない' do
        @item.genre_id = nil
        @item.valid?
      
        expect(@item.errors.full_messages).to include("Genre is not a number")
      end
      
      it 'status_idが空では登録できない' do
        @item.status_id = nil
        @item.valid?
 
        expect(@item.errors.full_messages).to include("Status is not a number")
      end
      
      it 'shippingが空では登録できない' do
        @item.shipping_id= nil
        @item.valid?
      
     
        expect(@item.errors.full_messages).to include("Shipping is not a number")
      end
      
      
      it 'chargeが空では登録できない' do
        @item.charge_id = nil
        @item.valid? 
        
         expect(@item.errors.full_messages).to include("Charge is not a number")
      end

      

      it 'region が空では登録できない' do
        @item.region_id  = nil
        @item.valid?
       
        expect(@item.errors.full_messages).to include("Region is not a number")
      end

      it 'price は全角（数字）で入力しないと登録できない' do
        @item.price  = '１００'
        @item.valid?
          
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'price が空では登録できない' do
        @item.price  = ''
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'price は0では登録できない' do
        @item.price  = '0'
        @item.valid?
   
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'price は9999999より大きい値では登録できない' do
        @item.price  = "10000000"
        @item.valid?
           
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it 'price は300未満では登録できない' do
        @item.price  = '0'
        @item.valid?
       
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end


      
        
    end
  end
  
end
