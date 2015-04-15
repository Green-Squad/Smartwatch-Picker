class CreateSupportedOs < ActiveRecord::Migration
  def change
    create_table :supported_os do |t|
      t.references :phone_os, index: true
      t.references :smartwatch, index: true

      t.timestamps
    end
  end
end
