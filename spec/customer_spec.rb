require 'spec_helper'

describe Wineshop::Customer do 
  let(:economy_code) { Wineshop::Prices::Economy }
  let(:popular_code) { Wineshop::Prices::Popular }
  let(:premium_code) { Wineshop::Prices::Premium }
  let(:super_premium_code) { Wineshop::Prices::SuperPremium }
  let(:ultra_premium_code) { Wineshop::Prices::UltraPremium }
  let(:luxury_code) { Wineshop::Prices::Luxury }
  let(:customer) { Wineshop::Customer.new(:name => "Rafael", :address => "My Place") }

  describe :statement do 
    context "When price code is economy" do 
      let(:economy_wine) { Wineshop::Wine.new(:name => "Borg", :price_code => economy_code) }
      let(:purchase) { Wineshop::Purchase.new(:item => economy_wine, :added_to_bill => false) }
      before(:each) do 
        customer.add_purchase(purchase)
      end
      subject { customer.statement } 
      it { should == "Statement for Rafael\n\tBorg\t3\nTotal Amount is 3\nBalance Owing is 3\n" }
    end

    context "When price code is popular" do 
      let(:popular_wine) { Wineshop::Wine.new(:name => "Borg", :price_code => popular_code) }
      let(:purchase) { Wineshop::Purchase.new(:item => popular_wine, :added_to_bill => false) }
      before(:each) do 
        customer.add_purchase(purchase)
      end
      subject { customer.statement }
      it { should == "Statement for Rafael\n\tBorg\t7\nTotal Amount is 7\nBalance Owing is 7\n" }
    end

    context "When price code is premium" do 
      let(:premium_wine) { Wineshop::Wine.new(:name => "Borg", :price_code => premium_code) }
      let(:purchase) { Wineshop::Purchase.new(:item => premium_wine, :added_to_bill => false) }
      before(:each) do 
        customer.add_purchase(purchase) 
      end
      subject { customer.statement }
      it { should == "Statement for Rafael\n\tBorg\t10\nTotal Amount is 10\nBalance Owing is 10\n" }
    end

    context "When price code is super premium" do 
      let(:super_premium_wine) { Wineshop::Wine.new(:name => "Borg", :price_code => super_premium_code) }
      let(:purchase) { Wineshop::Purchase.new(:item => super_premium_wine, :added_to_bill => false) }
      before(:each) do 
        customer.add_purchase(purchase)
      end
      subject { customer.statement }
      it { should == "Statement for Rafael\n\tBorg\t12\nTotal Amount is 12\nBalance Owing is 12\n" }
    end

    context "When price code is ultra premium" do 
      let(:ultra_premium_wine) { Wineshop::Wine.new(:name => "Borg", :price_code => ultra_premium_code) }
      let(:purchase) { Wineshop::Purchase.new(:item => ultra_premium_wine, :added_to_bill => false) }
      before(:each) do 
        customer.add_purchase(purchase)
      end
      subject { customer.statement }
      it { should == "Statement for Rafael\n\tBorg\t14\nTotal Amount is 14\nBalance Owing is 14\n" }
    end

    context "When price code is luxury" do 
      let(:luxury_wine) { Wineshop::Wine.new(:name => "Borg", :price_code => luxury_code) }
      let(:purchase) { Wineshop::Purchase.new(:item => luxury_wine, :added_to_bill => false) }
      before(:each) do 
        customer.add_purchase(purchase)
      end
      subject { customer.statement }
      it { should == "Statement for Rafael\n\tBorg\t17\nTotal Amount is 17\nBalance Owing is 17\n" }
    end

  end

end

