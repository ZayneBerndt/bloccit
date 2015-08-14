class AddAvatarToUsres < ActiveRecord::Migration
  def change
    add_column :usres, :avatar, :string
  end
end
