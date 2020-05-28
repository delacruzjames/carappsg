class AddMemberToApplicationForm < ActiveRecord::Migration[6.0]
  def change
    add_reference :application_forms, :member, null: false, foreign_key: true
  end
end
