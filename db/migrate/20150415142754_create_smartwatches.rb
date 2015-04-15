class CreateSmartwatches < ActiveRecord::Migration
  def change
    create_table :smartwatches do |t|
      t.string :name
      t.float :battery_life
      t.float :price
      t.date :release_date
      t.string :amazon_url
      t.string :image_path
      t.integer :engadget_score

      t.timestamps
    end
  end
end
