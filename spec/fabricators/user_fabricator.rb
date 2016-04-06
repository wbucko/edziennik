Fabricator(:user) do 
	email { Faker::Internet.email }
	password 'password'
end

Fabricator(:admin, from: :user) do 
	email 'admin@admin.pl'
end