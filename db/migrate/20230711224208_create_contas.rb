class CreateContas < ActiveRecord::Migration[6.1]
  def change
    create_table :contas do |t|
      t.decimal :saldo, default: 100.0, precision: 10, scale: 2
      t.boolean :bloqueada, default: false
      t.string :numero

      t.timestamps
    end
  end
end
