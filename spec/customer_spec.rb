require 'spec_helper'

describe Wineshop::Customer do 
  let(:customer) { Customer.new("Rafael", "My Place") }
  
  context "Statement" do 
    subject { customer.customer_statement } 
  end

end
