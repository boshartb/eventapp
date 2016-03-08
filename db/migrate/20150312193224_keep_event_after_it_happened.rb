class KeepEventAfterItHappened < ActiveRecord::Migration
  def change
    remove_column :events, :archived
    add_column :events, :keep_after_event, :boolean, default: false
  end
end
