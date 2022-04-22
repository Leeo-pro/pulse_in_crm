class CreateThanks < ActiveRecord::Migration[6.1]
  def change
    create_table :thanks do |t|
      t.text :thank

      t.timestamps
    end
  end
end
