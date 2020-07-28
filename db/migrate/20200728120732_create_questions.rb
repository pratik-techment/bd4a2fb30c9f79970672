class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :text_value
    end

    create_table :questions do |t|
      t.string :text_value
      t.references :user, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true
    end

    create_table :answers do |t|
      t.string :text_value
      t.references :question, index: true, foreign_key: true
    end
  end
end
