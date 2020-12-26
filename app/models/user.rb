class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         #has_many :items
         #has_many :orders


         with_options presence: true do
         
        
             validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/} 
             validates :last_name, format: { with:/\A[ぁ-んァ-ン一-龥]/}  
         
         
             validates :fname_kana, format: { with: /\A[ァ-ヶー－]+\z/ } 
             validates :lname_kana, format: { with: /\A[ァ-ヶー－]+\z/ }  
         
         
             validates :birthday 
             validates :nick_name

        end
       
        validates :password,  format: { with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze}
        validates :password, confirmation: true

end
