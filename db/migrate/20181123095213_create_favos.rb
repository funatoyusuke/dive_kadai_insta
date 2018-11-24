class CreateFavos < ActiveRecord::Migration[5.1]
  def change
    create_table :favos do |t|
      t.references :user
      t.references :picture
      t.timestamps
    end
  end
end
