class CreateLogKeeper < ActiveRecord::Migration
  def change
    create_table :log_keepers do |t|
      t.string :ip_address
      t.references :phone_os, index: true
      t.float :battery_life
      t.float :price
      
      t.timestamps
    end
  end
end
