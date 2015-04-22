require_relative 'aircraft'

class AcQueue

  #this class holds the aircraft queues and has the enqueue and dequeue methods,
  #it initializes a hash of all size and type combinations arrays 
  #keeping the priority order.

  attr_reader :queues

  def initialize 
    @type_sizes = Aircraft::TYPES.product(Aircraft::SIZES).map(&:join) #array of all type and size combinations keys in a priority order
    @queues  = Hash.new 
    @type_sizes.each{|ts| @queues[ts] = []} #adds key/value pair to hash per type_size combination, initializes the values as empty arrays
  end

  # adds an aircraft to the corresponding type/size queue 
  def enqueue(aircraft) 
    return "Not an aircraft instance" unless aircraft.class.name == "Aircraft" #prevents nil errors if the class is incorrect
    #adds the aircraft to the corresponding size and type queue, returns error messages if any parameters is invalid
    aircraft.valid? ? (queues["#{aircraft.type}#{aircraft.size}"] << aircraft) : aircraft.errors.join(', ') 
  end

  #loops the ordered size_types array to get the queues in a priority order, 
  #removes and returns the first aircraft added to the corresponding queue
  def dequeue 
    @type_sizes.each do |type_size|
      aircraft =  queues[type_size].shift #the shift method retrieves and at the same time removes the first item
      return aircraft unless aircraft.nil? #returns the aircraft if any was retrieved from the queue.
    end
    nil #returns nil if all queues are empty
  end
end

