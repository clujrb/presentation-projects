Given /^I have entered (.*) into the calculator$/ do |n|
  @calculator ||= Calculator.new
  @calculator.push(n.to_i)
end

When /^I press add$/ do
  @calculator.add
end

Then /^the result should be (\d+) on the screen$/ do |value|
  @calculator.screen.should == value.to_i
end


