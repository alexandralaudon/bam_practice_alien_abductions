class Person < ActiveRecord::Base
  has_many :abductions


  def full_name
    "#{first_name} #{last_name}".titleize
  end

end
