class RenameAgeColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column(:directors, :age, :birth_year)
  end
end
