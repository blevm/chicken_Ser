require 'pry'

#ruby
#===
module GuitarHero
  class String
    def press(fret)
      "Pressing #{fret}"
    end
  end
end

#binding.pry

string = GuitarHero::String.new
string.press("G") # => "Pressing G"

## ANSWER: If we use the module with the class String when calling #new, we have access
# to the methods within it.

ruby_string = String.new("Hey") # => "Hey"
ruby_string.press("G") # => undefined method `press' for "Hey":String

## ANSWER: If we don't call the GuitarHero module with the class String when calling #new, we don't have access
# to the methods within it.

#===

module ModuleFunction
  def self.call_me
    "Maybe"
  end
end

## ANSWER: Modules are just used to include or extend methods, not to instatiate instances of their own.
# We can call the class method on the module and it'll work.

ModuleFunction.call_me  # => "Maybe"
