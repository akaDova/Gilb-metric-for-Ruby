def swap(a, b)
  temp = a
  a = b
  b = temp
end

def bubble_sort(arr, r)
  pr = 0
  sr = 0
  i = 0
  while i < r - 1
    if arr[i] > arr[i + 1]
      sr += 1
      temp = arr[i]
      arr[i] = arr[i + 1]
      arr[i + 1] = temp
      pr += 1
      k = i
      flag = true
      while k > 0 && flag
        if arr[k - 1] > arr[k]
          sr += 1
          temp = arr[k]
          arr[k] = arr[k - 1]
          arr[k - 1] = temp
          pr += 1
          k -= 1
        else
          sr += 1
          flag = false
        end
      end
    else
      sr += 1
    end
    i += 1
  end
  puts "            #{sr} #{pr}"
  return arr
end

def select_sort(arr, r)
  sr = 0
  pr = 0
  i = 0
  while i < r - 1
    min = i
    j = i + 1
    while j < r
      if arr[j] < arr[min]
        min = j
        sr += 1
      else
        sr += 1
      end
      j += 1
    end
    temp = arr[i]
    arr[i] = arr[min]
    arr[min] = temp
    i += 1
  end
  puts "            #{sr} #{pr}"
  return arr
end

def quick_sort(arr, l, r)
  $sr = 0
  $pr = 0
  $arr = arr
  def quick(l, r)
    i = l
    j = r
    x = $arr[(l + r) / 2]
    until i > j
      $sr += 1
      while $arr[i] < x
        i += 1
        $sr += 1
      end
      $sr += 1
      while $arr[j] > x
        $sr += 1
        j -= 1
      end
      if i <= j
        temp = $arr[i]
        $arr[i] = $arr[j]
        $arr[j] = temp
        $pr += 1
        i += 1
        j -= 1
      end
    end
    if j > l
      quick(l, j)
    end
    if i < r
      quick(i, r)
    end
    # return arr
  end
  quick(l, r)
  puts "            #{$sr} #{$pr}"
  return $arr
end

def inverse(arr, r)
  i = 0
  while i < r % 2
    temp = arr[i]
    arr[i] = arr[r - i]
    arr[r - 1] = temp
  end
  return arr
end
$k = 1
while $k <= 3
  case $k
    when 1
      $r = 10
      $arr = Array.new($r)
      puts '-----------------------------------------------------------------------------------------------'
      i = 0
      while i < $r
        $arr[i] = rand 2000 - 1000
        i += 1
      end
      $arr1 = $arr.slice 0, $r
      $arr2 = $arr.slice 0, $r
      $arr3 = $arr.slice 0, $r
      puts 'not sorted'
      $arr1 = bubble_sort $arr1, $r
      $arr2 = select_sort $arr2, $r
      $arr3 = quick_sort $arr3, 0, $r - 1
      puts 'sorted'
      $arr1 = bubble_sort $arr1, $r
      $arr2 = select_sort $arr2, $r
      $arr3 = quick_sort $arr3, 0, $r - 1
      puts 'inverse sorted'
      $arr = inverse $arr, $r
      $arr1 = $arr.slice 0, $r
      $arr2 = $arr.slice 0, $r
      $arr3 = $arr.slice 0, $r
      $arr1 = bubble_sort $arr1, $r
      $arr2 = select_sort $arr2, $r
      $arr3 = quick_sort $arr3, 0, $r - 1
    when 2
      $r = 100
      $arr = Array.new($r)
      puts '-----------------------------------------------------------------------------------------------'
      i = 0
      while i < $r
        $arr[i] = rand 2000 - 1000
        i += 1
      end
      $arr1 = $arr.slice 0, $r
      $arr2 = $arr.slice 0, $r
      $arr3 = $arr.slice 0, $r
      puts 'not sorted'
      $arr1 = bubble_sort $arr1, $r
      $arr2 = select_sort $arr2, $r
      $arr3 = quick_sort $arr3, 0, $r - 1
      puts 'sorted'
      $arr1 = bubble_sort $arr1, $r
      $arr2 = select_sort $arr2, $r
      $arr3 = quick_sort $arr3, 0, $r - 1
      puts 'inverse sorted'
      $arr = inverse $arr, $r
      $arr1 = $arr.slice 0, $r
      $arr2 = $arr.slice 0, $r
      $arr3 = $arr.slice 0, $r
      $arr1 = bubble_sort $arr1, $r
      $arr2 = select_sort $arr2, $r
      $arr3 = quick_sort $arr3, 0, $r - 1
    when 3
      $r = 2000
      $arr = Array.new($r)
      puts '-----------------------------------------------------------------------------------------------'
      i = 0
      while i < $r
        $arr[i] = rand 2000 - 1000
        i += 1
      end
      $arr1 = $arr.slice 0, $r
      $arr2 = $arr.slice 0, $r
      $arr3 = $arr.slice 0, $r
      puts 'not sorted'
      $arr1 = bubble_sort $arr1, $r
      $arr2 = select_sort $arr2, $r
      $arr3 = quick_sort $arr3, 0, $r - 1
      puts 'sorted'
      $arr1 = bubble_sort $arr1, $r
      $arr2 = select_sort $arr2, $r
      $arr3 = quick_sort $arr3, 0, $r - 1
      puts 'inverse sorted'
      $arr = inverse $arr, $r
      $arr1 = $arr.slice 0, $r
      $arr2 = $arr.slice 0, $r
      $arr3 = $arr.slice 0, $r
      $arr1 = bubble_sort $arr1, $r
      $arr2 = select_sort $arr2, $r
      $arr3 = quick_sort $arr3, 0, $r - 1
  end
  $k += 1
end