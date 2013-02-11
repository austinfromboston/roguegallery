class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.string :url
      t.string :shorturl

      t.timestamps
    end
  end
end
