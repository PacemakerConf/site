namespace :admin do
  task :create => :environment do
  	puts "You will be prompted to enter username, an email address and password for the new admin"
  	puts "Please, enter username:"
  	username = STDIN.gets.strip
 		puts "Enter an email address:"
		email = STDIN.gets.strip
		puts "Enter a password:"
		password = STDIN.gets.strip
		puts "Confirm your password:"
		password_confirmation = STDIN.gets.strip
		raise ArgumentError.new("Confirmation pasword is not the same!") unless password == password_confirmation
    unless username.blank?||email.blank? || password.blank?
			if Admin.create!(
	    		username: username, 
	    		email: email, 
	    		password: password, 
	    		password_confirmation: password_confirmation,
	    		role: 'Admin'
	  		)
				puts "The admin was created successfully." 
			else
				puts "Sorry, the admin was not created! Data are missing or valid!"
			end
		end  
  end
end