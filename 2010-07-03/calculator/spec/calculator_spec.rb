require 'spec_helper'
require 'lib/calculator'

describe Calculator do
  subject { Calculator.new }
  
  its(:numbers) { should be_empty }
  its(:screen)  { should be_nil }
  
  describe "#push" do
    it "appends the number to the numbers queue" do
      subject.push(45)
      subject.numbers.should include(45)
    end
  end
  
  describe "#add" do
    before(:each) do
      (1..3).each { | number| subject.push(number) }
    end
    
    it "adds the numbers in the queue and updates the screen" do
      subject.add
      subject.screen.should == 6
    end
  end
end
