# This migration comes from meta_tags_railtie (originally 20140114154410)
class CreateMetaTagsList < ActiveRecord::Migration
  def change
    create_table :meta_tags_lists do |t|
      t.string :name
      t.string :identifier
      t.belongs_to :meta_taggable, polymorphic: true
      t.string :meta_title
      t.text :meta_description
      t.text :meta_keywords

      t.timestamps
    end
  end
end
