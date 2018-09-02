class ChangeDetails2OfKakeibos < ActiveRecord::Migration[5.2]
  def change
    rename_column :kakeibos, :kicyo_nen , :kicho_month
    rename_column :kakeibos, :kicyo_year ,:kicho_year
    rename_column :kakeibos, :kicyo_day,  :kicho_day
  end
end
