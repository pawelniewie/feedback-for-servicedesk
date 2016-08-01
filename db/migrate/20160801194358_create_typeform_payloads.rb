class CreateTypeformPayloads < ActiveRecord::Migration[5.0]
  def up
    create_table :typeform_payloads do |t|
      t.string :event_id, null: false, unique: true
      t.json :payload, null: false

      t.timestamps
    end
  end
end
