class ChangeColumnToPost < ActiveRecord::Migration[5.2]
   # 変更内容
  def up
    change_column :posts, :genre_status, :integer, null: false
  end

  # 変更前の状態
  def down
    change_column :posts, :genre_status, :integer, null: false, default: 0
  end
end
