require 'rails_helper'

describe Country do

  it "has a valid factory" do
    test1 = FactoryGirl.create(:country)
    expect(test1).to be_valid
  end
  
  it "is invalid without a name" do
    test2 = FactoryGirl.build(:country, name: nil)
    expect(test2).to_not be_valid
  end
  
  it "is invalid without a currency" do
    test3 = FactoryGirl.build(:country, currency: nil)
    expect(test3).to_not be_valid
  end
  
  it "is invalid without a timezone" do
    test4 = FactoryGirl.build(:country, timezone: nil)
    expect(test4).to_not be_valid
  end
  
  it "should destroy associated states when it is destroyed" do
    association = Country.reflect_on_association(:states)
    expect(association).to_not be_nil
    expect(association.options[:dependent]).to eq :destroy
  end
end