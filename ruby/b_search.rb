require 'pry'

class Array
  def b_search(element)
   # binding.pry
    done = false
    search_start = 0
    search_end = self.length-1

    while !done do
      length = search_end - search_start
      center = length/2 + search_start

      if(self[center]==element)
        done = true
      end

      if length < 1 && !done
        center = -1
        done = true
      end

      if self[center] < element
        search_start = center+1
      end

      if self[center] > element
         search_end = center-1
      end


    end
    return center

  end
end

test_array = [1,2,3,4,5,6,7,8,9,10]

puts test_array.b_search(10)
puts test_array.b_search(7)
puts test_array.b_search(1)

puts test_array.b_search(0)

