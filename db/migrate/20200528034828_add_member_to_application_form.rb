class AddMemberToApplicationForm < ActiveRecord::Migration[6.0]
  def change
    add_reference :application_forms, :member, foreign_key: true
  end
end
