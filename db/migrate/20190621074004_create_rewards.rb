class CreateRewards < ActiveRecord::Migration[5.2]
  def change
    create_table :rewards do |t|
      t.string :value, limit: 1, null: false
      t.string :invitee, limit:1
      t.boolean :accept_flag, default: false
      t.datetime :recommendation_sent_on, null: false
      t.float :points
      
      t.timestamps
    end
  end
end
