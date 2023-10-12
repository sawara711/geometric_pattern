class CreatePatterns < ActiveRecord::Migration[7.0]
  def change
    create_table :patterns do |t|
      t.references :user,     null: false, foreign_key: true
      t.string     :title,    null: false
      t.timestamps
    end
  end
end
