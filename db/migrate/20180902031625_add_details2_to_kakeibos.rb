class AddDetails2ToKakeibos < ActiveRecord::Migration[5.2]
  def change
    add_column :kakeibos, :kicyo_year, :integer
    add_column :kakeibos, :kicyo_nen, :integer
    add_column :kakeibos, :kicyo_day, :integer
  end
end
