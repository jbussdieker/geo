class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :filename
      t.float :lng
      t.float :lat

      t.timestamps
    end
  end
end
