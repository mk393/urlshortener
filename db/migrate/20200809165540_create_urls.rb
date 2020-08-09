class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :o_url
      t.string :s_url
      t.boolean :active
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
