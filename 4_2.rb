require 'pp'
require 'set'

module Composite
  def show_tree # shows the recursive structure
    indent
    puts self.class.to_s
    each do |elt|
      elt.depth = depth + 1
      if elt.respond_to? 'show_tree'
        elt.show_tree
      else
        elt.show
      end
    end
  end
end

module ExObject
  attr_accessor :depth

  private # an instance can call this method only to itself
  def indent
    self.depth ||= 0
    print '  ' * depth
  end

  protected
  def show # any subclass instance can call this method of another internal instance
    indent
    puts to_s
  end
end

module GroupCount
  def group_by # overrides Enumerable#group_by when the subclass includes this module
    res = super
    ret = { }
    res.each { |key,value| ret[key] = value.length}
    ret
  end
end

module Stat
  def sum
    reduce{|a, b| a.to_f + b}
  end
  def mean
    sum / length
  end
end

class Object
  include ExObject
end

class Array
  include Composite
end

class Set
  include Composite
end

class MyArray < Array
  include GroupCount
end

class MySet < Set
  include GroupCount
end

class StatArray < Array
  include Stat
end

class Counter
  # class variables and class methods
  def self.count(arg)
    @@h ||= { }
    arg.each do |elt|
      @@h[elt] ||= 0
      @@h[elt] += 1
    end
  end
  def self.print
    p @@h
  end
end

Set[
    [1,2],
    [
     3,
     Set[4,4,5,5]
    ],
   ].show_tree
# Set
#   Array
#     3
#     Set
#       5
#       4
#   Array
#     1
#     2

a1 = Array[1,1,3,3,4,6]
p a1.group_by {|x| x % 2} # {0=>[4, 6], 1=>[1, 1, 3, 3]}

s1 = Set[1,1,3,3,4,6]
p s1.group_by {|x| x % 2} # {0=>[6, 4], 1=>[1, 3]}

a2 = MyArray[1,1,3,3,4,6]
p a2.group_by {|x| x % 2} # {0=>2, 1=>4} 2 evens and 4 odds

s2 = MySet[1,1,3,3,4,6]
p s2.group_by {|x| x % 2} # {0=>2, 1=>2} 2 evens and 2 odds


a3 = StatArray[1,1,3,3,4,6]
p a3.mean # 3.0

Counter.count(a1)
Counter.count(a2)
Counter.count(a3)
Counter.count(s1)
Counter.count(s2)

Counter.print # {6=>5, 1=>8, 3=>8, 4=>5}
