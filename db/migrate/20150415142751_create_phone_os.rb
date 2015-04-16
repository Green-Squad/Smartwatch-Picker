class CreatePhoneOs < ActiveRecord::Migration
  def change
    create_table :phone_oses do |t|
      t.string :name

      t.timestamps
    end
  end
end
