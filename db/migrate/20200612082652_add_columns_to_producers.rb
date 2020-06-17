class AddColumnsToProducers < ActiveRecord::Migration[5.2]
  def change
    add_column :producers, :address, :string
    add_column :producers, :phone_number, :string
    add_column :producers, :website, :string
  end
end