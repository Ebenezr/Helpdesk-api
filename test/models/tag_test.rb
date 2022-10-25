class  TagTest < ActiveSupport::TestCase
    test 'valid tag' do
        tag = Tag.new(name: 'sqlite')
        assert tag.valid?
    end

    test 'invalid without username' do
        tag = Tag.new()
        refute tag.valid?, 'user is valid without a name'
        assert_not_nil tag.errors[:name], 'no validation error for name present'
    end

end