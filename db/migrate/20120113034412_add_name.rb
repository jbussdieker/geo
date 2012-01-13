class AddName < ActiveRecord::Migration
  def up
    add_column :images, :name, :string
  end

  def down
    remove_column :images, :name
  end
end
