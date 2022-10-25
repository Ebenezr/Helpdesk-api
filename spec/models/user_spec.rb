require 'rails_helper'


RSpec.describe User, type: :model do
  subject {User.new(username:"bles", first_name:"Blessing", last_name:"Dorcas", email:"bledorcas@gmail.com", password:"Ble123")}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a username" do
    subject.username=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a first_name" do
    subject.first_name=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a last_name" do
    subject.last_name=nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a email" do
    subject.email=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end


  context 'when username is unique' do
    before { User.create!(username: 'sqlite',  first_name:'Vincent', last_name:'Otieno', email:'vinoti@gmail.com', password:'Vin123') }
    it {expect(subject).to be_valid}
  end

  

  context 'when email is unique' do
    before { User.create!(username: 'sqlite',  first_name:'Vincent', last_name:'Otieno', email:'vinoti@gmail.com', password:'Vin123') }
    it {expect(subject).to be_valid}
  end

  

end
