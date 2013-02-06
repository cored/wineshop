require 'spec_helper'

describe Wineshop::Customer do 
  let(:economy_code) { Wineshop::Wine::EconomyPrice }
  let(:popular_code) { Wineshop::Wine::PopularPrice }
  let(:premium_code) { Wineshop::Wine::PremiumPrice }
  let(:super_premium_code) { Wineshop::Wine::SuperPremiumPrice }
  let(:ultra_premium_code) { Wineshop::Wine::UltraPremiumPrice }
  let(:luxury_code) { 5 }
  let(:customer) { Wineshop::Customer.new("Rafael", "My Place") }
  
  describe :statement do 
    context "When price code is economy" do 
      let(:economy_wine) { Wineshop::Wine.new("Borg", economy_code) }
      let(:purchase) { Wineshop::Purchase.new(economy_wine) }
      before(:each) do 
        customer.add_purchase(purchase)
      end
      subject { customer.statement } 
      it { should == "Statement for Rafael\n\tBorg\t3\nTotal Amount is 3\nBalance Owing is 3\n" }
    end

    context "When price code is popular" do 
      let(:popular_wine) { Wineshop::Wine.new("Borg", popular_code) }
      let(:purchase) { Wineshop::Purchase.new(popular_wine) }
      before(:each) do 
        customer.add_purchase(purchase)
      end
      subject { customer.statement }
      it { should == "Statement for Rafael\n\tBorg\t7\nTotal Amount is 7\nBalance Owing is 7\n" }
    end

    context "When price code is premium" do 
      let(:premium_wine) { Wineshop::Wine.new("Borg", premium_code) }
      let(:purchase) { Wineshop::Purchase.new(premium_wine) }
      before(:each) do 
        customer.add_purchase(purchase) 
      end
      subject { customer.statement }
      it { should == "Statement for Rafael\n\tBorg\t10\nTotal Amount is 10\nBalance Owing is 10\n" }
    end

    context "When price code is super premium" do 
      let(:super_premium_wine) { Wineshop::Wine.new("Borg", super_premium_code) }
      let(:purchase) { Wineshop::Purchase.new(super_premium_wine) }
      before(:each) do 
        customer.add_purchase(purchase)
      end
      subject { customer.statement }
      it { should == "Statement for Rafael\n\tBorg\t12\nTotal Amount is 12\nBalance Owing is 12\n" }
    end

    context "When price code is ultra premium" do 
      let(:ultra_premium_wine) { Wineshop::Wine.new("Borg", ultra_premium_code) }
      let(:purchase) { Wineshop::Purchase.new(ultra_premium_wine) }
      before(:each) do 
        customer.add_purchase(purchase)
      end
      subject { customer.statement }
      it { should == "Statement for Rafael\n\tBorg\t14\nTotal Amount is 14\nBalance Owing is 14\n" }
    end

    pending "When price code is luxury" do 
      let(:luxury_wine) { Wineshop::Wine.new("Borg", luxury_code) }
      let(:purchase) { Wineshop::Purchase.new(luxury_wine) }
      before(:each) do 
        customer.add_purchase(purchase)
      end
      subject { customer.statement }
      it { should == "Statement for Rafael\n\tBorg\t17\nTotal Amount is 17\nBalance Owing is 17\n" }
    end
  end

end
