class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :icon
      t.string :sex
      t.date :age
      t.float :weight
      t.float :rate

      t.timestamps
    end
  end
end
