class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      t.string "title"
      t.string "editor"
      t.text "content"
      t.integer :user_id
      t.string :avatar #파일 저장할 구성
      
      t.timestamps null: false
      
    end
  end
end
