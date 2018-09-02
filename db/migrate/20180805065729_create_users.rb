class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_id              # ユーザID
      t.string :name                 # ユーザ名
      t.string :email                # メールアドレス
      t.string :password             # パスワード
      t.timestamps
    end
  end
end
