class CreateActivityImages < ActiveRecord::Migration[6.1]
  def change
    create_table :activity_images do |t|
      t.string :activityName
      t.string :imageUrl

      t.timestamps
    end
  end
end
