class CreateLaughLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :laugh_logs do |t|
      t.references :post, null: false, foreign_key: true
      t.float :button_pressed_time

      t.timestamps
    end
  end
end
