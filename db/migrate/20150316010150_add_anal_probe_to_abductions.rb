class AddAnalProbeToAbductions < ActiveRecord::Migration
  def change
    add_column :abductions, :anal_probe, :boolean
  end
end
