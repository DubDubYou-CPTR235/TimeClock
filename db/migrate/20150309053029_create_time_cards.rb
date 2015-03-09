class CreateTimeCards < ActiveRecord::Migration
  def change
    create_table :time_cards do |t|
      t.integer :user_id
      t.integer :task_id
      t.integer :clocked_in

      t.timestamps null: false
    end
  end
end
