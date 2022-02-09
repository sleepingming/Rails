class AddTimeAttributeToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :time, :string
  end
end
