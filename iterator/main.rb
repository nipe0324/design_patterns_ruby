require 'array_iterator'

# 外部イテレータ
array = %w(red green blue)
ite = ArrayIterator.new(array)

# これでもうまく動く
# ite = ArrayIterator.new("abc")

while ite.has_next?
  puts "item: #{ite.next_item}"
end


# 内部イテレータ
def for_each_element(array)
  i = 0
  while i < array.length
    yield(array[i])
    i += 1
  end
end

a = [10, 20, 30]
for_each_element(a) { |element| puts "The element is #{element}" }
