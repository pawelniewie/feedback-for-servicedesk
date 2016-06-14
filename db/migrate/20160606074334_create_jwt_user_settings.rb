class CreateJwtUserSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :jwt_user_settings do |t|
      t.integer :jwt_user_id, null: false
      t.string :promoter_token
    end

    add_foreign_key :jwt_user_settings, :jwt_users, on_delete: :cascade
  end
end
