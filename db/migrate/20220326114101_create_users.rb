class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :title
      t.date :first_day
      t.date :last_day
      t.boolean :last_check
      t.string :memo

      t.timestamps
    end
  end
end
