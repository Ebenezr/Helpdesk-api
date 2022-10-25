class UserTest < ActiveSupport::TestCase

    test 'valid user' do
        user = User.new(username: 'Joni', first_name:'John', last_name:'Kamau', email: 'john@example.com', password:'jon123', password_confirmation:'jon123')
        assert user.valid?
    end

    test 'invalid without username' do
        user = User.new(first_name:'John', last_name:'Kamau', email: 'john@example.com', password:'jon123', password_confirmation:'jon123')
        refute user.valid?, 'user is valid without a username'
        assert_not_nil user.errors[:username], 'no validation error for username present'
    end

    test 'invalid without first_name' do
        user = User.new(username: 'Joni', last_name:'Kamau', email: 'john@example.com', password:'jon123', password_confirmation:'jon123')
        refute user.valid?, 'user is valid without a username'
        assert_not_nil user.errors[:first_name], 'no validation error for first_name present'
    end
    
    test 'invalid without last_name' do
        user = User.new(username: 'Joni',first_name:'John', email: 'john@example.com', password:'jon123', password_confirmation:'jon123')
        refute user.valid?, 'user is valid without a username'
        assert_not_nil user.errors[:last_name], 'no validation error for last_name present'
    end

    test 'invalid without email' do
        user = User.new(username: 'Joni', first_name:'John', last_name:'Kamau', password:'jon123', password_confirmation:'jon123')
        refute user.valid?
        assert_not_nil user.errors[:email]
    end

   


end
