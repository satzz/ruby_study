# -*- coding: utf-8 -*-
p '  ** problem 15 **'
class Animal
  def initialize(name)
    @name = name
  end
  def name
    @name
  end
  def walk
    puts 'an animal is walking.'
  end
end

class Human < Animal
  def walk
    puts 'a human is walking.'
  end
  def bark
    puts name + ': Wow!'
  end
end

class Dog < Animal
  def bark
    puts name + ': Bow!'
  end
end

class Male < Human
end

class Female < Human
end

d = [
     Male.new('John'),
     Dog.new('Sam'),
     Female.new('Mary'),
     Dog.new('Tom'),
     Female.new('Alice'),
    ] # an array

h = {} # a hash
d.each do |x| # an iterator
  x.bark # the methods of different classes are called (polymorphism)
  # John: Wow!
  # Sam: Bow!
  # Mary: Wow!
  # Tom: Bow!
  # Alice: Wow!
  klass = x.class
  if klass.to_s != 'Dog' # a condition
    h[klass] ||= 0
    h[klass] += 1
  end
end

require 'pp'
pp h
# {Female=>2, Male=>1}

while (print 'walk?[y/n]'; gets =~ /^y/) # a loop
  Human.new('Ken').walk # a human is walking.
  Male.new('Bob').walk # a human is walking.
end



