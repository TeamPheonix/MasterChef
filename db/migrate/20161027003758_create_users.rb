class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :privileges
      t.integer :user_level
      t.integer :points

      t.timestamps
    end
  end
end
