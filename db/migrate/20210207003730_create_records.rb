class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.integer :project_id
      t.text :json_field

      t.timestamps
    end
  end
end
