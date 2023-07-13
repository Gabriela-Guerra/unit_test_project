class CreateMovimentos < ActiveRecord::Migration[6.1]
  def change
    create_table :movimentos do |t|
      t.references :conta, null: false, foreign_key: true
      t.string :descricao
      t.decimal :valor, precision: 10, scale: 2

      t.timestamps
    end
  end
end
