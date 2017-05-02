class CreateWorkSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :work_sessions do |t|
      t.string :task
      t.decimal :total_time
      t.decimal :estimated_time
      t.boolean :status
      t.integer :workday_id

      t.timestamps
    end
  end
end
