# frozen_string_literal: true

class AddSuperAdminFlag < ActiveRecord::Migration
  def change
    add_column :users, :super_admin, :boolean, default: false
  end
end
