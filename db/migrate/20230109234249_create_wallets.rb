class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets do |t|
      t.decimal :value, default: 0
      t.belongs_to :user

      t.timestamps
    end
  end
end
