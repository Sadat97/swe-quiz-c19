class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.string :title
      t.belongs_to :question, foreign_key: true
      t.boolean :correct_choice

      t.timestamps
    end
  end
end
