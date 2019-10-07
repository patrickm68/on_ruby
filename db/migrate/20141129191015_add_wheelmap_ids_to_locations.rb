# frozen_string_literal: true

class AddWheelmapIdsToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :wheelmap_id, :string
  end
end
