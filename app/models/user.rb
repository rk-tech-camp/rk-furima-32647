class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items
         has_many :orders


         
        #  validates :email,inclusion: { in:["@"] }
        #  validates :encrypted_password,  length: { minimum: 6 }
         validates :password,  format: { with:/\A[a-z0-9]+\z/}
         #validates :, confirmation: true
         validates :first_name, format: { with: /\A[一-龥]+\z/}
         validates :last_name, format: { with:/\A[一-龥]+\z/}
         validates :fname_kana, format: { with: /\p{katakana}/ }
         validates :lname_kana, format: { with: /\p{katakana}/ }
         
         

end
