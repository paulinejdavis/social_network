require_relative '../lib/user_repository'
require_relative '../lib/user'
 
RSpec.describe UserRepository do

    def reset_social_network_tables
        seed_sql = File.read('spec/seeds_users.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
        connection.exec(seed_sql)
    end


    before(:each) do 
        reset_social_network_tables
    end
  
    it 'returns all users' do
        repo = UserRepository.new

        users = repo.all

        expect(users.length).to eq 4
        expect(users[0].id).to eq "1" 
        expect(users[0].username).to eq "Matthew"

        expect(users[1].id).to eq "2" 
        expect(users[1].username).to eq "Mark"

        expect(users[2].id).to eq "3" 
        expect(users[2].username).to eq "Luke" 

        expect(users[3].id).to eq "4"
        expect(users[3].username).to eq "John"  
    end


    it 'returns a single user' do
        repo = UserRepository.new

        user = repo.find(1)

        expect(user.id).to eq "1"
        expect(user.username).to eq "Matthew"
    end

    it 'add a new user' do
        repo = UserRepository.new

        new_user = User.new
        # new_ user.email_address = "mary@magdalane.com"
        new_user.username = 'Mary'

        repo.create(new_user)

        all_users = repo.all 

        expect(all_users).to include(
            have_attributes(
                email_address: new_user.email_address,
                username: new_user.username
            )
        )
    end

    #issue with delete user test
    xit 'deletes a user' do
        repo = UserRepository.new
        user_delete = 1
        repo.delete(user_delete)

        all_users = repo.all
    
        expect(all_users.length).to eq 1
        expect(all_users.first.id).to eq "1"
    end
end
