class CreateAbductions < ActiveRecord::Migration
  def change
    create_table :abductions do |t|
      t.integer :alien_id
      t.integer :person_id

      t.timestamps
    end
  end
end
