class CreateTaskAplicaties < ActiveRecord::Migration
  def change
    create_table :task_aplicaties do |t|
      t.string :title
      t.string :description
      t.boolean :completed
      t.datetime :startDate
      t.datetime :endDate

      t.timestamps null: false
    end
  end
end
