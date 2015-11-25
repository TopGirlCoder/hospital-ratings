class CreateTables < ActiveRecord::Migration
	def change
	  	create_table :users do |t|
	  		t.string :first_name
	  		t.string :last_name
	  		t.string :email
	  		t.string :password_hash
	  		t.timestamps null: false
	  	end
	  	create_table :hospitals do |t|
	  		t.string :name
	  		t.string :location
	  		t.timestamps null: false
	  	end
	  	create_table :ratings do |t|
	  		t.integer :stars
	  		t.references :user
	  		t.references :hospital
	  		t.timestamps null: false
	  	end
  	end
end
