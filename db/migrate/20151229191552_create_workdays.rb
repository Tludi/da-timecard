class CreateWorkdays < ActiveRecord::Migration
  def change
    create_table :workdays do |t|
      t.decimal :hoursWorked
      t.integer :user_id
      t.date :dayDate
      t.integer :project_id
      t.text :notes

      t.timestamps null: false
    end
  end
end
