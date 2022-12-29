class AddVideoRefToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :video, null: false, foreign_key: true
  end
end
