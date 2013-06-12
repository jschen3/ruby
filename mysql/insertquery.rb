require 'mysql'
begin
  con = Mysql.new 'localhost','root','password','test' # connect to database using the user:root password:password db: test
  #maketbquery = con.query 'CREATE TABLE Plants(Id INT PRIMARY KEY AUTO_INCREMENT , Species VARCHAR(25) , Treatment INT(11), Site INT(11))'
  for i in 0..5 # loop until i reaches 5 from 0. 
    treatment = rand(100) # treatment is a random integer from 0 to 99
    rnamegen = rand(5) # rnamegen is a random integer from 0 to 4
    site = rand(50); 
    case rnamegen #generate a species name
      when 0
        name='banana'
      when 1
        name='lime'
      when 2
        name ='wheat'
      when 3
        name ='grape'
      when 4
        name ='algae'
    end   
    insertquery= con.query "INSERT INTO Plants (Species,Treatment,Site) VALUES ('#{name}', #{treatment},#{site})" # insert it into the db
    puts ("name=#{name} treatment = #{treatment} site= #{site}")
  end
  
rescue Mysql::Error => e
    puts e.errno
    puts e.error
    
ensure
    con.close if con
end
  