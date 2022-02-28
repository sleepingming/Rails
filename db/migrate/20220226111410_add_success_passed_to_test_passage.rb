class AddSuccessPassedToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :success_passed?, :boolean, default: false
  end
end
