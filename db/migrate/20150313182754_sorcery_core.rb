class SorceryCore < ActiveRecord::Migration
	def up
    add_column :users, :email, :string
    add_column :users, :crypted_password, :string
    add_column :users, :salt, :string

    if User.count > 0
    	puts "#{User.count} Users need to have their email address set"
    	puts "Generating #{User.count} random email addresses"
	    User.all.reduce([]) do |used_emails, user|
	    	email = generate_email(used_emails)
	    	user.update_attributes(email: email)
	    	used_emails << email
	    end
	  end

    change_column :users, :email, :string, null: true
    add_index :users, :email, unique: true
	end

	def down
		remove_index :users, column: :email
	  remove_column :users, :email, :string
	  remove_column :users, :crypted_password, :string
	  remove_column :users, :salt, :string
	end

	private
	def generate_email(unavailable_emails)
		tries_left = 10
		while tries_left > 0
			email = Faker::Internet.email
			return email unless unavailable_emails.include?(email)
			tries_left -= 1
		end
		raise "Could not generate a uniquely random email :("
	end
end