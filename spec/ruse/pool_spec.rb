require File.dirname(__FILE__) + "/../spec_helper"

describe Ruse::Pool do  
  it "should map an operation across arrays and return the result to the handler" do
    pool = Ruse::Pool.new 5
    results = []
    (1..10).each do |i|
      pool.process do
        results << (1..10).inject(sum = 0) { |sum, i| sum +=i }
      end
    end
    pool.shutdown
    results.should == [55] * 10
  end
end