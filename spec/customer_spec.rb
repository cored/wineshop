require 'spec_helper'

describe Wineshop::Customer do 
  let(:economy_price) { 0 }
  let(:customer) { Wineshop::Customer.new("Rafael", "My Place") }
  let(:purchase) { Wineshop::Purchase.new(wine) }
  
  context "Statement for an economy wine" do 
    let(:wine) { Wineshop::Wine.new("Borg", economy_price) }
    before(:each) do 
      customer.add_purchase(purchase)
    end
    subject { customer.statement } 
    it { should == "Statement for Rafael\n\tBorg\t3\nTotal Amount is 3\nBalance Owing is 3\n" }
  end

end
