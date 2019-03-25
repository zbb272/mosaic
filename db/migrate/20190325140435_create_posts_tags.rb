class CreatePostsTags < ActiveRecord::Migration[5.1]
  def change
    create_table :posts_tags do |t|
      t.belongs_to :post, foreign_key: true
      t.belongs_to :tag, foreign_key: true

      t.timestamps
    end
  end
end
