require_relative 'ac_queue'

#booting the system
puts "Booting ...\n\n"
ac_queue = AcQueue.new

#enqueuing aricrafts
puts "Enqueuing Aircrafts ....\n\n"
ac1 = Aircraft.new(type: "cargo", size: "large")
ac_queue.enqueue(ac1)
puts "#{ac1.to_s} enqueued\n"
ac2 = Aircraft.new(type: "passenger", size: "small")
ac_queue.enqueue(ac2)
puts "#{ac2.to_s} enqueued\n"
ac3 = Aircraft.new(type: 'cargo', size: "small")
ac_queue.enqueue(ac3)
puts "#{ac3.to_s} enqueued\n"
ac4 = Aircraft.new(type: "passenger", size: "large")
ac_queue.enqueue(ac4)
puts "#{ac4.to_s} enqueued\n"
ac5 = Aircraft.new(type: 'cargo', size: "small")
ac_queue.enqueue(ac5)
puts "#{ac5.to_s} enqueued\n"
ac6 = Aircraft.new(type: "passenger", size: "large")
ac_queue.enqueue(ac6)
puts "#{ac6.to_s} enqueued\n\n"

#dequeuing aricrafts
puts "dequeuing Aircrafts ....\n\n"

puts "#{ac_queue.dequeue.to_s} dequeued\n"
puts "#{ac_queue.dequeue.to_s} dequeued\n"
puts "#{ac_queue.dequeue.to_s} dequeued\n"
puts "#{ac_queue.dequeue.to_s} dequeued\n"
puts "#{ac_queue.dequeue.to_s} dequeued\n"
puts "#{ac_queue.dequeue.to_s} dequeued\n"
