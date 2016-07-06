class CreateProjectConfigurations < ActiveRecord::Migration[5.0]
  def change
    create_table :project_configurations do |t|
      t.references :jwt_token, foreign_key: true, index: false, on_delete: :destroy

      t.integer :project_id, null: false

      t.string :product_name, null: false, default: ''
      t.string :language, null: false, default: 'en'
      t.string :reply_to, null: false
      t.string :from, null: false
      t.string :subject, null: false
      t.text :introduction, null: false, default: ''

      t.timestamps
    end

    add_index(:project_configurations, [:jwt_token_id, :project_id], unique: true)
  end
end
