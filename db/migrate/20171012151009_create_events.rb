class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events, id: :uuid do |t|
      t.text :address, null: false, default: ""
      t.text :email_type, null: false, default: ""
      t.text :event, null: false, default: ""
      t.datetime :timestamp, null: false, default: Time.now

      t.timestamps
    end

    add_index :events, :email_type
    add_index :events, :event
  end
end
