require 'spec_helper'

describe User do
  it { should have_many(:seshes) }
  it { should have_valid(:email).when('justuseapen@gmail.com') }
  it { should_not have_valid(:email).when('user@mycom',
    'usermy.com',
    'user',
    '.com',
    'my.com') }
end
