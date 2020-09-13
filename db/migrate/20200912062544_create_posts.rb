class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string 		:content, 		null: false
      t.string  	:author, 		default: "ABC"
      t.boolean		:is_deleted, default: false
      t.timestamps
    end
  end
end
