class CreateEngagements < ActiveRecord::Migration
  def change
    create_table :engagements do |t|
      t.integer :user_id
      t.integer :event_id
      t.boolean :secret, :default => false

      t.timestamps null: false
    end
  end
end
