require 'rails_helper' 

describe City do 

  it "has a valid factory" do
    test1 = FactoryGirl.create(:city)
    expect(test1).to be_valid
  end
  
  it "is invalid without a name" do
    test2 = FactoryGirl.build(:city, name: nil)
    expect(test2).to_not be_valid
  end
  
  it "is invalid without population" do
    test3 = FactoryGirl.build(:city, population: nil)
    expect(test3).to_not be_valid
  end

  it "is invalid without area" do
    test3 = FactoryGirl.build(:city, area: nil)
    expect(test3).to_not be_valid
  end
end