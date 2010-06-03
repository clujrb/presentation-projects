class Calculator
  attr_reader :numbers
  
  def initialize
    @numbers = []
  end
  
  def push(number)
    @numbers << number
  end
  
  def add
    @result = @numbers.inject(0) { |sum, value| sum + value }
  end
  
  def screen
    @result
  end
end

