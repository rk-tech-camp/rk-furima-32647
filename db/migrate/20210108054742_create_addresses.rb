class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal,        null: false
      t.integer :region_id,    null: false
      t.string :city,          null: false
      t.string :build,         null: false
      t.string :number
      t.string :phone,         null: false
      t.references :order,     foreign_key: true


      t.timestamps
    end
  end
end
