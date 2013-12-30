require 'spec_helper'

describe Sesh do
	let(:blank_values) { [nil,''] }
  it { should have_valid(:name).when('Study','Working all day and night') }
  it { should_not have_valid(:name).when(*blank_values) }
  it { should belong_to(:user) }
  it { should have_many(:distractions) }
  

end
