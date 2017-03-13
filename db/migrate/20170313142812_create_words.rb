class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.string :name
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
