class AddInfoToProducers < ActiveRecord::Migration[5.2]
  def change
    add_column :producers, :first_name, :string
    add_column :producers, :last_name, :string
    add_column :producers, :address, :string
    add_column :producers, :description, :text
  end
end
