class CreateKakeibos < ActiveRecord::Migration[5.2]
  def change
    create_table :kakeibos do |t|
      t.date :kicho_date
      t.integer :food_exp
      t.integer :amusement
      t.integer :entertainment_exp
      t.integer :transport_exp
      t.integer :daily_necessities
      t.integer :fixture
      t.integer :beauty_exp
      t.integer :otherwise_exp
      t.string :memo

      t.timestamps
    end
  end
end
