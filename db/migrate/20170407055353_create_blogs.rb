class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :author
      t.string :description

      t.timestamps
    end
  end
end
