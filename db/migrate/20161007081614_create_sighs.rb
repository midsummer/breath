class CreateSighs < ActiveRecord::Migration
  def change
    create_table :sighs do |t|
      t.datetime :created_at
      t.timestamps null: false
    end
  end
end
