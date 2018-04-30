require 'pry'

#ruby
#===
class Vehicle
  def go!
    "VRoom!"
  end
end

class Car < Vehicle
end

honda = Car.new
honda.go! # => "VRoom!"

## ANSWER: Car is inherited from Vehicle so it inherits all its methods. Since there's not a #go!
# method in Car, honda.go! runs the Vehicle #go! method.

#===
class Vehicle
  def go!
    "VRoom!"
  end
end

class Car < Vehicle
  def go!
    "Screeeeeetch"
  end
end

honda = Car.new
honda.go! # => "Screeeeeetch"

## ANSWER: Car is inherited from Vehicle so it inherits all its methods. Since there's a #go!
# method in Car, honda.go! runs the Car #go! method.

#===
class Vehicle
  def go!
    "VRoom!"
  end
end

class Car < Vehicle
  def go!
    super
  end
end

honda = Car.new
honda.go! # => "VRoom!"

## ANSWER: There is a #go! method in Car but it just calls super without any changes, so the method
# will return the Vehicle #go! method.

#===
class Vehicle
  def go!
    "VRoom!"
  end
end

class Car < Vehicle
  def go!
    from_vehicle = super
    "Screeeeetch #{super}"
  end
end

binding.pry

honda = Car.new
honda.go! # => "Screeeeetch VRoom!"

## ANSWER: We have a Car #go! method, where we set the return value from the Vehicle method saved
# to a local variable and then interpolated into a new string that is returned.
# We could also interpolate super "Screeeeetch #{super}"

#===
class Car
  def say_make
    "My Make is #{@make}"
  end
end

class Honda < Car
  def initialize
    @make = "Honda"
  end
end

#binding.pry

honda = Honda.new
honda.say_make # => "My Make is Honda"

## ANSWER: We initialized a new instance of the Honda class and defined the @make at that time.
#Then when we call the Car #say_make method we have access to that set @make variable.

#===
class Car
  def initialize
    @classification = "A Car"
  end

  def describe
    "I am #{@classification}, of make #{@make}"
  end
end

class Honda < Car
  def initialize
    @make = "Honda"
  end
end

honda = Honda.new
honda.describe # => "I am , of make Honda"

##ANSWER: We initialized a new instance of Honda with the Honda initialize method. So that only defines the
# @make variable and doesn't reference the Car initialize method so we don't define the @classification variable.
# We could fix this by adding super to the Honda initialize method.

#===
class Car
  def initialize
    @classification = "A Car"
  end

  def describe
    "I am #{@classification}, of make #{@make}"
  end
end

class Honda < Car
  def initialize
    super
    @make = "Honda"
  end
end

honda = Honda.new
honda.describe # => "I am A Car, of make Honda"

## ANSWER: Adding super fixes the issue from the one before.
