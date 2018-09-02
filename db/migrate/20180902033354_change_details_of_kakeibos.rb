class ChangeDetailsOfKakeibos < ActiveRecord::Migration[5.2]
  def change
    change_column :kakeibos, :kicyo_year, :string
    change_column :kakeibos, :kicyo_nen,  :string
    change_column :kakeibos, :kicyo_day,  :string
  end
end
