class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name 
      t.string :email
      t.string :encrypted_password 
      t.string :salt
      t.datetime :date_created
    end
  end
end
