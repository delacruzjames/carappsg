class CreateApplicationForms < ActiveRecord::Migration[6.0]
  def change
    create_table :application_forms do |t|
      t.string :name
      t.string :email, null: false
      t.string :company
      t.string :message

      t.timestamps
    end

    add_index :application_forms, :email, unique: true
  end
end
