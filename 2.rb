# -*- coding: utf-8 -*-
p ' ** problem 6 ** '

a = [1,2,3]
p a[2] # 3
p a[1] # 2
p a[0] # 1
p a[-1] # 3 = a[a.length-1]
p a[-2] # 2 = a[a.length-2]
p a[-3] # 1 = a[a.length-3]

p ' ** problem 7 ** '

class Klass
    def m
        1
    end
end

class Checker
    def m (o)
        o && o.m
    end
end

c = Checker.new
p c.m(nil) # nil
p c.m(Klass.new) # 1


p ' ** problem 8 ** '

class Orfoo 
    def m (y)
        y || 'foo'
    end
end

o = Orfoo.new
p o.m('bar') # 'bar'
p o.m('') # ''
p o.m(0) # 0 
p o.m(nil) # 'foo'


p ' ** problem 9 ** '

p 1 === 1 # true
p 1 === 1.0 * 1.0 # true
p 'foo' === 'foo' # true
p "foo" === 'foo' # true
p 1.to_s === '1' # true
p 1 === '1'.to_i # true
p [1,2,3] === [1,2,3] # true
p ({'a' => 1, 'b' => 2} === {'a' => 1, 'b' => 2}) # true
p ({'b' => 2, 'a' => 1} === {'a' => 1, 'b' => 2}) # true
p nil === nil # true

p (1..3) === (1..3) # false
p Range.new(1,3) === Range.new(1,3) # false
p o === Klass.new # false
p 0 === nil # false
p nil === false # false
p 0 === false # false
p 1 === '1' # false
p 1 === true # false


p ' ** problem 10 ** '

counter = 0
while (counter) do
    counter += 1
    next if counter % 2 == 1
    p counter
    break if counter == 10
end


p ' ** problem 11 ** '

def mycos(x, method = 'rad') # a default argument
  method == 'rad' or x *= Math::PI / 180
  Math.cos(x)
end
p mycos(Math::PI / 4) # cos(pi/4) = 0.707106781186548
p mycos(45, 'deg') # cos(45[deg]) = 0.707106781186548

def var (*elt) # the variance of the arguments
  size = elt.length
  sum = elt.inject{ |s,i| s+=i}.to_f
  if size > 0
    avg = sum / size
    elt.inject{ |s,i| s+=(i-avg)**2} / size
  else
    0
  end
end
p var(3, 5, 7) # 2.33333333333333


p ' ** problem 12 ** '
def repeat(n)
  n.times {yield}
end
repeat (3) {p 'hello world!'}


p ' ** problem 13 ** '
class Str < String
  def + (arg)
    length + arg.length
  end
  def - (arg)
    gsub(arg, '')
  end
end
p Str.new('hello') + 'world' # length('hello') + length('world') = 5 + 5 = 10
p Str.new('adabracadabra') - 'a' - 'b' - 'c' - 'd' # 'rr'


p ' ** problem 14 ** '
class String
  def + (arg)
    length + arg.length
  end
  def - (arg)
    gsub(arg, '')
  end
end
p 'hello' + 'world'
p 'adabracadabra' - 'a' - 'b' - 'c' - 'd'
 # the same result as problem 13
