class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :location
      t.string :imageUrl
      t.string :category

      t.timestamps
    end
  end
end
