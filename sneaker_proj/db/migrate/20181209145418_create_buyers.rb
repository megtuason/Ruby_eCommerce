class CreateBuyers < ActiveRecord::Migration[5.2]
  def change
    create_table :buyers do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :sex
      t.date :birthday

      t.timestamps
    end
    add_index :buyers, :email, unique: true
  end
end
