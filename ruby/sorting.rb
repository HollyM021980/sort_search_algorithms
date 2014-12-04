require 'benchmark'
require 'pry'
class Array

  def bubble_sort
    counter = 0
    arr_end = self.length - 1
    while counter < arr_end
      current_position = 0
      while current_position < arr_end
        if self[current_position] > self[current_position + 1]
          self.swap(current_position, current_position + 1)
        end
        current_position += 1
      end
      counter += 1
    end
    self
  end

  def selection_sort
    sorted_array = []
    temp_array = self
    arr_end = temp_array.length
    counter = 0
    while counter < arr_end
      index = temp_array.index(temp_array.min)
      sorted_array << temp_array.slice!(index)
      counter += 1
    end
    sorted_array
  end

  # def quick_sort
  #   greater_than = []
  #   less_than = []
  #   pivot = self[0]
  #   counter = 1
  #   while counter < self.length || self.length == 1
  #     if self[counter] < pivot
  #       less_than << self[counter]
  #     else
  #     # elsif self[counter] > pivot
  #       greater_than << self[counter]
  #     end
  #     counter += 1
  #   end
  #   puts [pivot] + less_than.quick_sort + greater_than.quick_sort
  # end

  def quick_sort(arr, left, right)
    if (right > left)
      pivot_ind = partition(arr, left, right)
      quick_sort(arr, left, pivot_ind-1)
      quick_sort(arr, pivot_ind+1, right)
    end
  end

  # def partition(arr, left_ind, right_ind)
  #   pivot = arr[left_ind]
  #   left_iterator = left #i
  #   right_iterator = right + 1; #j
  #   while true
  #     while (arr[++left_iterator] < pivot)
  #       if (left_iterator >= right_ind) break end
  #     end
  #     while (arr[--right_iterator] > pivot)
  #       if (right_iterator <= left_ind) break end
  #     end
  #     if (left_iterator >= right_iterator)
  #       break
  #     else
  #       self.swap(left_iterator, right_iterator)
  #       # temp = arr[left_iterator]
  #       # arr[left_iterator] = arr[right_iterator]
  #       # arr[right_iterator] = temp
  #     end
  #   end
  # end



  def swap(left, right)
    # binding.pry
    temp = self[right]
    self[right] = self[left]
    self[left] = temp
    self
  end

end


# For I = 2 to N
# J = I
# Do while (J > 1) and (A(J) < A(J - 1)
# Temp = A(J)
# A(J) = A(J - 1)
# A(J - 1) = Temp
# J = J - 1
# End-Do
# End-For
def insertion_sort
  array = self
  return array if array.length <= 1
  (1...array.length).each do |i|
    j = i
    loop do
      break if j <= 0 || array[j] > array[j-1]
      temp = array[j]
      array[j] = array[j-1]
      array[j-1] = temp
      j = j - 1
    end
  end
  array
end
# 1. Pick an element, called a pivot, from the array.
# 2. Reorder the array so that all elements with values less than the pivot come before the pivot, while all elements with values greater than the pivot come after it (equal values can go either way). After this partitioning, the pivot is in its final position. This is called the partition operation.
# 3. Recursively apply the above steps to the sub-array of elements with smaller values and separately to the sub-array of elements with greater values.
def quick_sort
  return self if self.length <= 1
  array = self
  pivot_index = (array.length/2).to_i
  pivot = array[pivot_index]
  left_array = []
  right_array = []
  (0...pivot_index).each do |i|
    left_array << array[i] if array[i] <= pivot
    right_array << array[i] if array[i] > pivot
  end
  (pivot_index+1...array.length).each do |i|
    left_array << array[i] if array[i] <= pivot
    right_array << array[i] if array[i] > pivot
  end
  left_array = left_array.quick_sort if left_array.length > 1
  right_array = right_array.quick_sort if right_array.length > 1
  left_array + [pivot] + right_array
end


  #TODO
  def merge_sort
  end

array = [3,6,14,2, 25,5,1]
array2 = [1,3,6,14,2, 25,5]
puts "bubble"
puts array2.bubble_sort
# puts "\nselection"
# puts array2.selection_sort
# puts array.quick_sort
# puts array.swap(0,1)

