class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :image
      t.string :title
      t.text :description

      t.date :start_date
      t.date :end_date
      t.time :time

      t.string :address

      t.boolean :archived, :default => false
      t.boolean :secret, :default => false

      t.datetime :published_at
      t.timestamps null: false
    end
  end
end
