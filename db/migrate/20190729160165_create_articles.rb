class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.references :author, references: :users, foreign_key: { to_table: :users}
      t.integer :state, dafault: 0

      t.timestamps
    end
  end
end
