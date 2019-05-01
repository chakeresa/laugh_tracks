class AddDirectorToEpisodes < ActiveRecord::Migration[5.1]
  def change
    add_reference :episodes, :director, foreign_key: true
  end
end
