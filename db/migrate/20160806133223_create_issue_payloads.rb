class CreateIssuePayloads < ActiveRecord::Migration[5.0]
  def change
    create_table :issue_payloads do |t|
      t.json :payload, null: false

      t.timestamps
    end
  end
end
