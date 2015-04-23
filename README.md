# AircraftQueue
## Problem Statement
A software subsystem of an air-traffic control system is defined to manage a queue of aircraft (AC) in an airport.
The aircraft queue is managed by a process which responds to three types of requests:
* system boot		used to start the system.
* enqueue aircraft		used to insert a new AC into the system.
* dequeue aircraft		used to remove an AC from the system.

AC’s have at least (but are not limited to having) the following properties:

*	AC type:			Passenger or Cargo
*	AC size:			Small or Large

The process which manages the queue of AC’s satisfies the following:
*	There is no limit on the number of AC’s it can manage
*	Dequeue aircraft requests result in selection of one AC for removal such that:
  * Passenger AC’s have removal precedence over Cargo AC’s.
  * Large AC’s of a given type have removal precedence over Small AC’s of the same type.
  * Earlier enqueued AC’s of a given type and size have precedence over later enqueued AC’s of the same type and size.

## How to run the code.

The code has been written using ruby 2.1.1. 
After cloning the repository you should run the following command:
    
    ruby main.rb

This file initializes the ac_queue, enqueues multiples aircrafts and dequeues in the correct order.
You can modify the  main.rb file with new entries. 

## How to run  the tests.
The tests has been written using rspec 3.0.0. To run the test you need the execute the following command:

    rspec  .

All the tests should pass.
