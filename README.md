# テーブル設計




## users テーブル


| Column   | Type   | Options     |
|--------  |------  |-----------  |
|nick_name| string | null: false  |
|first_name| string | null: false |
|last_name | string | null: false |
|fname_kana| string | null: false |
|lname_kana| string | null :false |
｜birthday  | date  | null :false  |
| email    | string | null :false 、unique: true|    
| encrypted_password | string | null: false    |



### Association
- has_many :items
- has_many :orders
- 
  

## items テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| item_name     | string | null: false |
| item_note     | text   | null: false |
| price         | integer| null: false |             
| status_id     | integer| null: false |
| charge_id     | integer| null: false |
| region_id     | integer| null: false |
| date_id       | integer| null: false |
| category_id   | integer| null: false |
| user          | references | foreign_key|
             

* user foreign_key

### Association

- belong_to:user
- has_one :order

   

## orders テーブル

| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| item     | references |   foreign_key:true             |
| user     | references |    foreign_key:true            |

* item    foreign_key
* user    foreign_key


### Association

- belongs_to :item
- belongs_to :user
  has_one    :address

## addresses テーブル
| Column   | Type       | Options       |
| -------  | ---------- | ------------- |
| postal   | string     |   null: false | 
| region_id| integer    |   null: false |                             
| city     | string     |   null: false |  
| build    | string     |   null: false |                         
| number   | string     |               |                            
| phone    | string     |   null: false |                             
| order    | references |foreign_key:true |
 
