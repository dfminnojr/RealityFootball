require 'spec_helper'


describe User do

  let(:user) {User.create(username: 'Dave', email: 'davidmferris@hotmail.com')}


  it { should have_many :points }
  it { should have_many :games }
  it { should have_many :responses }
  it { should validate_presence_of :username}
  it { should validate_presence_of :email}
  it { should validate_presence_of :password}

end
