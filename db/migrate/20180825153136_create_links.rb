class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :main_url
      t.string :short_url

      t.timestamps
    end
  end
end
