class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
    	t.string :email
    	t.string :password_digest
      t.timestamps
    end
    add_index :admins, :email, unique: true
  end
end
