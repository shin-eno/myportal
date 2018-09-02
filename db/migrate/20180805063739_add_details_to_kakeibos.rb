class AddDetailsToKakeibos < ActiveRecord::Migration[5.2]
  def change
    add_column :kakeibos, :jiko_toushi, :integer
  end
end
