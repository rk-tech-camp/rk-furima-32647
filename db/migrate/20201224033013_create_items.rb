class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name ,    null: false 
      t.text :item_note ,        null: false 
      t.integer :price   ,       null: false              
      t.integer :status_id,      null: false 
      t.integer :charge_id ,    null: false 
      t.integer :region_id ,     null: false 
      t.integer :shipping_id   ,   null: false 
      t.integer :genre_id  ,  null: false 
      t.references :user       ,    foreign_key: true
                

      t.timestamps
    end
  end
end
