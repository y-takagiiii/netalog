class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.string :search_word
      t.string :youtube_id
      t.string :title
      t.text :description
      t.string :thumbnail
      t.integer :view_count

      t.timestamps
    end
  end
end
