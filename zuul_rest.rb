
require 'net/http'
require 'rubygems'
require 'json'

puts " "

@user = 'cspear@rallydev.com'
@pass = 'password1'
@host = 'test16cluster.zuul1.f4tech.com'
@port = '3000'


def create_payload(username,password)
  @payload ={
    #{}"username" => "cspear@rallydev.com",
    #{}"password" => "password1"
    "username" => username,
    "password" => password
    }.to_json
 end

#PUT /key - create a key (described above)
#PUT /user - insert a user (described above) - these need authorization, so will have to make them in their own sub.
#PUT /subscription.js - create a subscription  - same as user.   put_zuul can create the authkey for the slmadmin

def put_zuul(url_ext)
  req = Net::HTTP::Put.new(url_ext, initheader = {'Content-Type' =>'application/json'})
    req.body = @payload
    response = Net::HTTP.new(@host, @port).start {|http| http.request(req) }
    puts "Response #{response.code} #{response.message}:
    #{response.body}"

  serialized = response.body
  data = JSON.parse(serialized)
  
  puts " "
  puts "-- parsed PUT data --"
     
  puts "authKey        = #{data['authKey']}"
  puts "username       = #{data['username']}"
  puts "userid         = #{data['userId']}"
  puts "subscriptionId = #{data['subscriptionId']}"
  puts "roles          = #{data['roles']}"
  puts "all data       = #{data}"

  puts " "
end


##

# 1. put create_payload into each of the def's, it think.
# 2.

#GET /key/<key>.js - read/validate a key
#GET /user/<userID>.js - get a user's data by id (must be authenticated as slmadmin)
#GET /user/name/<username> - get a user's data by name (must be authenticated as slmadmin)
#GET /subscription/<subscriptionID> - get a subscription's data (must be authenticated as slmadmin)

def get_zuul(url_ext)
  req = NET::HTTP::Get.new(url_ext, initheader = {'Content-Type' => 'application/json'})
    req.body = @payload 
    response = Net::HTTP.new(@host, @port).start {|http| http.request(req) }
    puts "Response #{reponse.code} #{response.message}"

  serialized = response.body
  data = JSON.parse(serliazed)
  
  puts " "
  puts "-- parsed GET response --"

  puts "authKey        = #{data['authKey']}"
  puts "username       = #{data['username']}"
  puts "userid         = #{data['userId']}"
  puts "subscriptionId = #{data['subscriptionId']}"
  puts "roles          = #{data['roles']}"
  puts "all data       = #{data}"

  puts " "

end

#DELETE /key/<key>.js - delete a key/logout
#DELETE /user/<userID>.js - delete a user
def delete_zuul(url_ext)
  req = NET::HTTP::Delete.new(url_ext, initheader = {'Content-Type' => 'application/json'})
    req.body = @payload 
    response = Net::HTTP.new(@host, @port).start {|http| http.request(req) }
    puts "Response #{reponse.code} #{response.message}"

  serialized = response.body
  data = JSON.parse(serliazed)

  puts " "
  puts "-- parsed DELETE response --"

  puts "authKey        = #{data['authKey']}"
  puts "username       = #{data['username']}"
  puts "userid         = #{data['userId']}"
  puts "subscriptionId = #{data['subscriptionId']}"
  puts "roles          = #{data['roles']}"
  puts "all data       = #{data}"

  puts " "

end

#POST /user/<userID>.js - update a user’s info
def post_zuul(url_ext)

  @payload ={}

  req = NET::HTTP::Post.new(url_ext, initheader = {'Content-Type' => 'application/json'})
    req.body = @payload 
    response = Net::HTTP.new(@host, @port).start {|http| http.request(req) }
    puts "Response #{reponse.code} #{response.message}"

  serialized = response.body
  data = JSON.parse(serliazed)

  puts "-- parsed POST response --"

  puts "authKey        = #{data['authKey']}"
  puts "username       = #{data['username']}"
  puts "userid         = #{data['userId']}"
  puts "subscriptionId = #{data['subscriptionId']}"
  puts "roles          = #{data['roles']}"
  puts "all data       = #{data}"

  puts " "

end




#probably put this in each def.
create_payload("cspear@rallydev.com","password1")

thepost = put_zuul("/key.js")
puts thepost


create_payload("slmadmin","w0rk$h0p")
get_slmkey = put_zuul("/key.js")
puts get_slmkey




#  Zuul's api available.

#PUT /key - create a key (described above)                "/key.js"
#PUT /user - insert a user (described above)              "/user.js"
#PUT /subscription.js - create a subscription             "/subscription.js"

#GET /key/<key>.js - read/validate a authKey(cookie)
#GET /user/<userID>.js - get a user's data by id (must be authenticated as slmadmin)
#GET /user/name/<username> - get a user's data by name (must be authenticated as slmadmin)
#GET /subscription/<subscriptionID> - get a subscription's data (must be authenticated as slmadmin)

#DELETE /key/<key>.js - delete a key/logout
#DELETE /user/<userID>.js - delete a user

#POST /user/<userID>.js - update a user’s info

###########
#http -v PUT test16cluster.zuul1.f4tech.com:3000/user.js Authorization:'Zuul authentication_key="/key/-429_aqDJQBGMFHidSlrl-Kznn6pUdEIaht83upXDplowaIhT97JBXiYfL_O40KI.js"' username=foobley@yaboo.com password=Password1 subscriptionId=7b7b6dd2e5344ff09bdb073bb54b08b4 roles:=[0] sessionTimeout:=100


#page = open('test16cluster.zuul1.f4tech.com:3000/key.js')

puts "< done ---- done >"



#GET_zuul('test16cluster')

## PUT authkey
##
## PUT test16cluster.zuul1.f4tech.com:3000/key.js username=  password=
##
## response will be 200 or 401 and look like this.
## /key/RS5v_LAkIOmbXsU-E7WyWtK7IficJ2ZXyFB2gsesgOzJXMGhtJy1v3P72iOtrS3u.js
##
##
## Create a new user

## PUT test16cluster.zuul1.f4tech.com:3000/user.js Authorization:'Zuul authentication_key="/key/-429_aqDJQBGMFHidSlrl-Kznn6pUdEIaht83upXDplowaIhT97JBXiYfL_O40KI.js"' username=foobley@yaboo.com password=Password1 subscriptionId=7b7b6dd2e5344ff09bdb073bb54b08b4 roles:=[0] sessionTimeout:=100

