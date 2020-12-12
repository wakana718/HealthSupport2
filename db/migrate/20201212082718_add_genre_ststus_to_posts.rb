class AddGenreStstusToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :genre_status, :integer, null: false, default: 0
  end
end
