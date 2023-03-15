class CreatePlayListPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :play_list_posts do |t|
      t.references :play_list, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
    add_index :play_list_posts, [:play_list_id, :post_id], unique: true
  end
end
