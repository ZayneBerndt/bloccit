class CreateSummary < ActiveRecord::Migration
  def change
    create_table :summary do |t|
      t.references :Post, index: true, foreign_key: true
      t.text :body
      

      t.timestamps null: false
    end
  end
end
