class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author_first_name
      t.string :author_last_name
      t.integer :pub_year
      t.string :edition
      t.string :blurb
      t.string :physical_description

      t.timestamps
    end
  end
end
