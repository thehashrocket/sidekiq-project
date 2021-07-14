class CreateShortUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :short_urls do |t|
      t.string :short_url
      t.string :long_url
      t.string :description
      t.boolean :active, default: true

      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
