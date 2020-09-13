class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references  :post, 			null: false
      t.string		:author, 		default: "ABC"
      t.string 		:desc,			null: false
      t.boolean 	:is_deleted,	default: false
      t.timestamps
    end
  end
end
