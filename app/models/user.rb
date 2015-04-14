class User < ActiveRecord::Base
  
  
  def self.make_with_pwd(email, username, password, role)
    salt = User.rand_string(4)
    encrypted_password = Digest::SHA2.hexdigest(salt+password)
    User.create({:email => email, :salt => salt, :encrypted_password => encrypted_password, :role => "member"}) 
  end 
  
  def self.rand_string(i)
    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    (0...i).map{ o[rand(o.length)] }.join
  end
  
  def check_pwd(pwd)
  	hash_pwd = self.salt + pwd
  	hash_pwd = Digest::SHA2.hexdigest(hash_pwd)
  	
  	if hash_pwd == self.encrypted_password
  		return true
  	else
  		return false
  	end

  end
  
  
  
end
