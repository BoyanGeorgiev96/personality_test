class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.text :name
      t.text :content
      t.integer :min_score
      t.integer :max_score

      t.timestamps
    end
  end
end
