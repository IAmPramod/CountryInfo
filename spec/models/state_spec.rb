require 'rails_helper' 

describe State do 
  
  it "has a valid factory" do
    test1 = FactoryGirl.create(:state)
    expect(test1).to be_valid
  end
  
  it "is invalid without a name" do
    test2 = FactoryGirl.build(:state, name: nil)
    expect(test2).to_not be_valid
  end
  
  it "is invalid without literacy" do
    test3 = FactoryGirl.build(:state, literacy: nil)
    expect(test3).to_not be_valid
  end
  
  it "should destroy associated cities when it is destroyed" do
    association = State.reflect_on_association(:cities)
    expect(association).to_not be_nil
    expect(association.options[:dependent]).to eq :destroy
  end

end