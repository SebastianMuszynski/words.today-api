class CreateTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :translations do |t|
      t.string :name
      t.references :word, foreign_key: true

      t.timestamps
    end
  end
end
