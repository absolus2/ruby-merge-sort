
# merge sort takes array and return a sorted array
def merge_sort(array)
  # if array <= 1 return
  return array if array.length <= 1
  # cut the array in half, left and right base on the length
  left,right = [], []
  array.each_with_index do |element, index|
    if index < (array.length)/2
      left << element
    else
      right << element
    end
  end
  # recursive to make it as small as posible
  left_one, right_two = merge_sort(left), merge_sort(right)
  # merge the two arrays together
  return merge(left_one, right_two)
end

def merge(left, right)
  result = []
  while !left.empty? && !right.empty?
    if left.first < right.first
      result << left.first
      left = left[1..-1]
    else
      result << right.first
      right = right[1..-1]
    end
  end
  while !left.empty?
    result << left.first
    left = left[1..-1]
  end
  while !right.empty?
    result << right.first
    right = right[1..-1]
  end
  return result
end


# insertion sort, takes array and return a sorted array
def insert_sort(array, results=[])
  # Iterate over the list
  array.each_with_index do |element, i|
    # If the first element append it to the result list
    if i == 0
      results << element
    else
      results = insertion(results, element)
    end
  end
 return results
end

def insertion(array, element)
  array.each_with_index do |item, index|
    if element <= item
      return  array.insert(index, element)
    elsif element >= item && index == array.length - 1
      return array.push(element)
    end
  end
end

# quickstory take array return a sorted array
def quicksort(array)
  # if array is less than 2 assume is sorted
  return array if array.length < 2
  # swap marker
  sm = array.length - 1
  # change the pivot to the last position, in this case pivot is index of half the array.
  array[array.length/2 - 1], array[-1] = array[-1], array[array.length/2 -1]
  # sort the array
  array.each_with_index do |item, index| 
    if item >= array.last
      until sm < index || array[sm] < array.last
        sm -= 1
      end
      if sm < index
        array[-1], array[index] = array[index], array[-1]
      elsif array[sm] < array.last
        array[sm], array[index] = array[index], array[sm]
      end
    end
  end
  # Partition the array left and right.
  left, right = quicksort(array[0..array.length/2 - 1]), quicksort(array[array.length/2..-1])
  # merge the both halfs
  return merge(left, right)
end
