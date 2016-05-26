class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :email
      t.string :coupon_code

      t.timestamps null: false
    end
  end
end
