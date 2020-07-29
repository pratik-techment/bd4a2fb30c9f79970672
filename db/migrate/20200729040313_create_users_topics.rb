class CreateUsersTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :topic
    end
  end
end
