class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.integer :account_id
      t.integer :work_session_id
      
      t.timestamps
    end
  end
end
