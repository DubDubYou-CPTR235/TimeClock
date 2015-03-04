class CreateClocks < ActiveRecord::Migration
  def change
    create_table :clocks do |t|
      t.integer "task_id"
      t.integer "user_id"
      t.boolean "clocked_in"
      t.timestamp "time_in"
      t.timestamp "time_out"

      t.timestamps
    end
  end
end
