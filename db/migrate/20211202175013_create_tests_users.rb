class CreateTestsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :tests_users do |t|

      t.timestamps
    end
  end
end
