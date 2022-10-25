require 'rails_helper'

RSpec.describe Tag, type: :model do

  subject {Tag.new(name:"ruby")}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name=nil
    expect(subject).to_not be_valid
  end

  context 'when name is unique' do
    before { Tag.create!(name: 'sqlite') }
    it {expect(subject).to be_valid}
  end

  it "should have many questions" do
    t = Tag.reflect_on_association(:questions)
    expect(t.macro).to eq(:has_and_belongs_to_many)
  end

 


end
