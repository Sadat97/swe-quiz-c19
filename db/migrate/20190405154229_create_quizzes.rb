class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.string :skill_type
      t.integer :pass_score
      t.integer :duration

      t.timestamps
    end
  end
end
