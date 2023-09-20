require 'benchmark'
require './furniture'

time = Benchmark.measure do
  selected_bed = KingSizeWoodenBed.new(76, 80)

  print "Original object \n\n"
  puts selected_bed

  serialized_object = Marshal.dump(selected_bed)

  print "\nSerialized object\n\n"
  puts serialized_object

  selected_bed = Marshal.load(serialized_object)

  print "\n\nOriginal object back\n\n"
  puts selected_bed
end

puts "\n\n Time taken: #{time}"
