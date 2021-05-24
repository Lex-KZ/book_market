class AddCostToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :cost, :integer
  end
end
