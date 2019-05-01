class AddThumbnailToDirectors < ActiveRecord::Migration[5.1]
  def change
    add_column :directors, :thumbnail, :string
  end
end
