require 'spec_helper'

describe Wineshop::Purchase do 
  let(:item) { Wineshop::Wine.new(:name => "Borg", :price_code => Wineshop::Prices::Economy) }

  context "Handling default values" do 
    let(:purchase_without_item) { Wineshop::Purchase.new(:added_to_bill => false) }
    subject { purchase_without_item.determine_amount }
    describe :determine_amount do 
      it { should == 0 }
    end
  end

  context "When purchase not added to bill" do 
    let(:purchase_not_in_bill) { Wineshop::Purchase.new(:item => item, :added_to_bill => false) }
    describe :determine_amount do 
      subject { purchase_not_in_bill.determine_amount }  
      it { should == 3 }
    end

    describe :calculate_balance do 
      subject { purchase_not_in_bill.calculate_balance } 
      it { should == 3 }
    end
  end

  context "When purchase has been added to bill" do 
    let(:purchase_in_bill) { Wineshop::Purchase.new(:item => item, :added_to_bill => true) }
    describe :calculate_balance do 
      subject { purchase_in_bill.calculate_balance }
      it { should == 0 }
    end
  end
end
