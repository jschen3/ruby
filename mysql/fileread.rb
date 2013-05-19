begin
  require 'csv'
  CSV.foreach('data.csv') do |line|
    plant=line[0] #tr looks for , and replaces it with '' or blank
    treatment=line[1]
    site=line[2]
    yields=line[3]
    puts "plants=#{plant}\n treatment=#{treatment} \n site=#{site}\n yields=#{yields}\n"
  end
end
  
  