class AddDateToAbduction < ActiveRecord::Migration
  def change
    add_column :abductions, :date, :date
  end
end
