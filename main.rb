require_relative 'ac_queue'

# booting the system
puts 'Booting ...\n\n'
ac_queue = AcQueue.new

# enqueuing aricrafts
puts 'Enqueuing Aircrafts ....\n\n'
ac1 = Aircraft.new(type: 'cargo', size: 'large')
ac_queue.enqueue(ac1)
puts "#{ac1.type_size} enqueued\n"
ac2 = Aircraft.new(type: 'passenger', size: 'small')
ac_queue.enqueue(ac2)
puts "#{ac2.type_size} enqueued\n"
ac3 = Aircraft.new(type: 'cargo', size: 'small')
ac_queue.enqueue(ac3)
puts "#{ac3.type_size} enqueued\n"
ac4 = Aircraft.new(type: 'passenger', size: 'large')
ac_queue.enqueue(ac4)
puts "#{ac4.type_size} enqueued\n"
ac5 = Aircraft.new(type: 'cargo', size: 'small')
ac_queue.enqueue(ac5)
puts "#{ac5.type_size} enqueued\n"
ac6 = Aircraft.new(type: 'passenger', size: 'large')
ac_queue.enqueue(ac6)
puts "#{ac6.type_size} enqueued\n\n"

# dequeuing aricrafts
puts 'dequeuing Aircrafts ....\n\n'

puts "#{ac_queue.dequeue.type_size} dequeued\n"
puts "#{ac_queue.dequeue.type_size} dequeued\n"
puts "#{ac_queue.dequeue.type_size} dequeued\n"
puts "#{ac_queue.dequeue.type_size} dequeued\n"
puts "#{ac_queue.dequeue.type_size} dequeued\n"
puts "#{ac_queue.dequeue.type_size} dequeued\n"
