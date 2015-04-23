require_relative 'aircraft'
# this class holds the aircraft queues and has the enqueue and dequeue methods,
# it initializes a hash of all size and type combinations arrays
# keeping the priority order.
class AcQueue
  attr_reader :queues

  def initialize
    # array of all type and size combinations keys in a priority order
    @type_sizes = Aircraft::TYPES.product(Aircraft::SIZES).map(&:join)
    @queues = {}
    # adds key/value pair to hash per type_size combination,
    # initializes the values as empty arrays
    @type_sizes.each { |ts| @queues[ts] = [] }
  end

  # adds an aircraft to the corresponding type/size queue
  def enqueue(aircraft)
    # prevents nil errors if the class is incorrect
    return 'Not an aircraft instance' unless aircraft.class.name == 'Aircraft'
    # adds the aircraft to the corresponding size and type queue,
    # returns error messages if any parameters is invalid
    aircraft.valid? ? queues[aircraft.type_size] << aircraft : aircraft.errors
  end

  # loops the ordered size_types array to get the queues in a priority order,
  # removes and returns the first aircraft added to the corresponding queue
  def dequeue
    @type_sizes.each do |type_size|
      # the shift method retrieves and at the same time removes the first item
      aircraft =  queues[type_size].shift
      # returns the aircraft if any was retrieved from the queue.
      return aircraft unless aircraft.nil?
    end
    nil # returns nil if all queues are empty
  end
end
