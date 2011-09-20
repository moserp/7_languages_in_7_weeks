def is_a_fourth_line? line_count
  line_count % 4 == 0
end

puts "Just using #each"
count = 0
(1..16).each do |item|
  print "#{item} "
  #count = count + 1
  #puts if (count % 4) == 0

  # or shorter hand, but is doing the assign in the if confusing?
  #puts if ((count = count + 1)  % 4) == 0

  # explains what is going on more?
  puts if is_a_fourth_line? (count = count + 1)
end

# The above would be slightly more pleasant if we could have used each_with_index and so
# could have used the index rather than having to maintain the count variable

puts "Using #each_slice"
(1..16).each_slice(4) do |slice|
  puts slice.join(" ")
end
