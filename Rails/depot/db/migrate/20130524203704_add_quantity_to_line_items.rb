class AddQuantityToLineItems < ActiveRecord::Migration
  def self.up
    add_column :line_items, :quantity, :integer, :default => 1 # add a new column called quantity the default value is 1.
  end

  def self.down
    remove_column :line_items, :quantity
  end
end
