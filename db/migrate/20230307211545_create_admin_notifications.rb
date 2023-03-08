class CreateAdminNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
