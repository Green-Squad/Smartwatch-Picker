class CreateSupportedOs < ActiveRecord::Migration
  def change
    create_table :supported_oses do |t|
      t.references :phone_os, index: true
      t.references :smartwatch, index: true

      t.timestamps
    end
  end
end
