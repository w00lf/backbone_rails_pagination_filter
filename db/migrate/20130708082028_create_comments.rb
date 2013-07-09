class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.integer :post_id
      t.text :content

      t.timestamps
    end
  end
end
