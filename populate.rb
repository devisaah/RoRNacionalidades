require 'net/http'
require 'net/https' # for ruby 1.8.7
require 'json'

module Populate
  def self.nationalities
    http = Net::HTTP.new('raw.githubusercontent.com', 443); http.use_ssl = true
    JSON.parse http.get('/devisaah/RoRNacionalidades/master/nationalities.json').body
  end


  def self.create
    nationalities.each do |nationality|
      Nationality.create(
        description: nationality['description'], 
        country: nationality['country'],
        country_int: nationality['country_int'],
        initials: nationality['initials']
      ) 
      puts "Adding nationality #{nationality['description']} to country #{nationality['country']}"
    end
  end
end

Populate.create
