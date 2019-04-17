class ChoiceDefaultToFalse < ActiveRecord::Migration[5.2]
  def change
    change_column :choices , :correct_choice , :boolean, :default => false
  end
end
