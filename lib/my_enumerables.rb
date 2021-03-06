module Enumerable
  # Your code goes here
  def my_each
    index = 0
    until index == self.length
      yield(self[index])
      index += 1
    end
    self
  end

  def my_each_with_index
    index = 0
    until index == self.length
      yield(self[index], index)
      index += 1
    end
    self
  end

  def my_select
    index = 0
    result = []
    until index == self.length
      result.push(self[index]) if yield(self[index])
      index += 1
    end
    result
  end

  def my_all?
    index = 0
    flag = true
    until index == self.length
      flag = false unless yield(self[index])
      index += 1
    end
    flag
  end

  def my_any?
    index = 0
    flag = false
    until index == self.length
      flag = true if yield(self[index])
      index += 1
    end
    flag
  end

  def my_none?
    index = 0
    flag = true
    until index == self.length
      flag = false if yield(self[index])
      index += 1
    end
    flag
  end

  def my_count
    index = 0
    counter = 0
    if block_given?
      until index == self.length
        counter += 1 if yield(self[index])
        index += 1
      end
      counter
    else
      self.length
    end
  end

  def my_map
    index = 0
    mapped_array = []
    until index == self.length
      mapped_array.push yield(self[index])
      index += 1
    end
    mapped_array
  end

  def my_inject(initial_value=nil)
    index = 0
    accumulator = initial_value.to_i
    until index == self.length
      accumulator = yield(accumulator, self[index])
      index += 1
    end
    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  include Enumerable
end
