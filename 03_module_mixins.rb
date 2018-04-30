require 'pry'
#ruby
#===
module Drivable
  def go!
    "Vroom!"
  end
end

class Car
  include Drivable
end

honda = Car.new
honda.go! # => "Vroom!"

## ANSWER: The #go! method works on instances of the class Car because we included
# the Drivable module in the Car class which has the method.

#===
Object.send(:remove_const, :Drivable)
Object.send(:remove_const, :Car)

module Drivable
  def go!
    "Vroom!"
  end
end

class Car
  include Drivable
  def go!
    "Screeeeetch!"
  end
end

## A_NOTE: Object.send resets the defined constants so we can define them multiple times in this document.
## ANSWER: honda.go! returns screech because the #go! method is defined for the Car class.

honda = Car.new
honda.go! # => "Screeeeetch!"

#===
Object.send(:remove_const, :Drivable)
Object.send(:remove_const, :Car)
module Drivable
  def go!
    "Vroom!"
  end
end

class Car
  include Drivable
  def go!
    "Screeeeetch!"
  end
end

honda = Car.new
honda.go! # => "Screeeeetch!"

## ANSWER: Same exercise as above

#===
Object.send(:remove_const, :Drivable)
Object.send(:remove_const, :Car)
module Drivable
  def go!
    "Vroom!"
  end
end

class Car
  prepend Drivable
  def go!
    "Screeeeetch!"
  end
end

honda = Car.new
honda.go! # => "Vroom!"

## ANSWER: The prepend command inserts the module into the chain of inheritance BEFORE the class.
# So, the Drivable module will be the first thing checked before the Car methods are checked.

#===
Object.send(:remove_const, :Drivable)
Object.send(:remove_const, :Car)
module Drivable
  def go!
    "Vroom!"
  end
end

class Car
  include Drivable
  def go!
    super
  end
end

binding.pry

honda = Car.new
honda.go! # => "Vroom!"

## ANSWER: Second in line to be checked is the Drivable module since using include OR extend with modules injects them
# into the inheritance chain, so since super is called in the method for the Car class, it checks for a method in Drivable next.

#===
Object.send(:remove_const, :Drivable)
Object.send(:remove_const, :Car)
module Drivable
  def go!
    super
  end
end

class Car
  prepend Drivable
  def go!
    "Screeeeetch!"
  end
end

honda = Car.new
honda.go! # => "Screeeeetch!"

## ANSWER: Since we used prepend for the Drivable module, it inserts the module at the bottom of the line of inheritance.
# So when we use 'super' in the Drivable module, the next thing in line to check will be the Car #go! method.

#===
Object.send(:remove_const, :Drivable)
Object.send(:remove_const, :Car)
module Drivable
  def go!
    "Vroom!"
  end
end

class Car
  prepend Drivable
  def go!
    "Screeeeetch!"
  end
end

honda = Car.new
def honda.go!
  "Raaaghn!"
end

#binding.pry

honda.go! # => "Raaaghn!"

## ANSWER: We defined a new method for the instance 'honda' after creating that instance of the class Car.
# So that's the first thing checked.

#===
Object.send(:remove_const, :Drivable)
Object.send(:remove_const, :Car)
module Drivable
  def go!
    "Vroom!"
  end
end

class Car
  include Drivable
  def go!
    "Screeeeetch!"
  end
end

honda = Car.new

def honda.go!
  "Raaaghn!"
end

honda.go! # => "Raaaghn!"

## ANSWER: The return value for the 'honda instance' is the same thing because
# the instance is the lowest in the inheritance chain and we defined a method for it.

#===
Object.send(:remove_const, :Drivable)
Object.send(:remove_const, :Car)
module Drivable
  def go!
    "Vroom!"
  end
end

class Car
  include Drivable
  def go!
    "Screeeeetch!"
  end
end

honda = Car.new

def honda.go!
  "Raaaghn!"
end

toyota = Car.new

honda.go! # => "Raaaghn!"
toyota.go! # => "Screeeeetch!"


## ANSWER: Nothign changes from above examples for 'honda', because we defined a new instance method for it.
# Since we didn't define a new method for the toyota instance, it uses the next in line in the line of inheritance
# which is the instance method for the Car class.

#===
module Excitable
  def shout!
    "Don't tell me what to do!"
  end
end

class Person
  extend Excitable
end

Person.shout! # => "Don't tell me what to do!"
bob = Person.new
bob.shout!  # => undefined method `shout!' for #<Person:0x007fad09829390>

## ANSWER: The #shout! method is an instance method, so you would have to call Person.shout! or change
# extend to include in the Person class, if you wanted to call #shout! on the 'bob' instance.
