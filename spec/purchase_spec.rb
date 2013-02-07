require 'spec_helper'

describe Wineshop::Purchase do 
  let(:item) { Wineshop::Wine.new(:name => "Borg", :price_code => Wineshop::Prices::Economy) }
  let(:purchase) { Wineshop::Purchase.new(:item => item, :added_to_bill => false) }

  context "Valid data" do 
    describe :determine_amount do 
      subject { purchase.determine_amount }  
      it { should == 3 }
    end

    describe :calculate_balance do 
      subject { purchase.calculate_balance } 
      it { should == 3 }
    end
  end
end
