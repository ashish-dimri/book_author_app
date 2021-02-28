class CreateJoinTableAuthorsBooks < ActiveRecord::Migration[5.2]
  def change
    create_join_table :authors, :books do |t|
      t.references :author, foreign_key: true
      t.references :book, foreign_key: true
    end
  end
end
