class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :local_id
      t.string :remote_id, null: false

      t.timestamps
    end

    add_index :projects, :name
    add_index :projects, :status
  end
end
