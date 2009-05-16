require 'pp'
p '  ** problem 2-1 **'
foo = 'fizz'
bar = foo
p foo << 'buzz' # "fizzbuzz"
p bar # "fizzbuzz"


p '  ** problem 2-2 **'
foo = 'fizz'
bar = foo
p foo + 'buzz' # "fizzbuzz"
p bar # "fizz"


p '  ** problem 2-3 **'
a = []
b = a
pp a << 1 # [1]
pp b # [1]


p '  ** problem 2-4 **'
a = []
2.times do |i|
  x = 'fizz'
  x << i.to_s
  a << x
end
pp a # ["fizz0", "fizz1"] the first x and the second x are different objects


p '  ** problem 2-5 **'

def m (i)
  x = 'fizz'
  x << i.to_s
end

a = []
2.times do |i|
  a << m(i)
end
pp a #["fizz0", "fizz1"] the same as problem 2-4


p '  ** problem 3-1 **'

class Parent
  def call_priv
    begin
      Parent.new.m_priv
    rescue => ex
      p "#{ex.class}: #{ex.message}"
    end
  end
  
  protected
  def m_prot
    p 'Parent#m_prot is called'
  end

  private
  def m_priv
    p 'Parent#m_priv is called'
  end
end

class Child < Parent
  def call_prot
    Parent.new.m_prot
  end
  def call_priv
    m_priv
  end
end

Child.new.call_prot # 'Parent#m_prot is called'
# An instance of the subclass can call the protected method of another internal instance.

p '  ** problem 3-2 **'
Child.new.call_priv # 'Parent#m_priv is called'
# An instance of the subclass can call the private method.

p '  ** problem 3-3 **'
Parent.new.call_priv # "NoMethodError: private method `m_priv' called for #<Parent:0x266d8>"
# An exception is raised because an instance cannot call the private method of another subclass.

p '  ** problem 3-4 **'
class Klass4
  def initialize
    @@foo = 1
  end 
  def instance_method
    @@foo = 2
  end
  def self.klass_method
    @@foo = 3
  end
  def p
    puts @@foo
  end
end
i1 = Klass4.new # the class data is initialized by 1
i1.p # 1
i1.instance_method # the class data is updated to 2 by the instance method
i1.p # 2
i2 = Klass4.new # the class data is reinitialized by 1
i1.p # 1
i2.p # 1
Klass4.klass_method # the class data is updated to 3 by the class method
i1.p # 3
i2.p # 3
i3 = Klass4.new # the class data is reinitialized by 1
i1.p # 1
i2.p # 1
i3.p # 1

p '  ** problem 3-5 **'
module MM
  def m1
    p 'MM#m1 is called'
  end
  def m3
    p 'MM#m3 is called'
  end
end

module M
  include MM
  def m1
    p 'M#m1 is called'
  end
  def m2
    p 'M#m2 is called'
  end
end

module NN
  def m1
    p 'NN#m1 is called'
  end
  def m6
    p 'NN#m6 is called'
  end
end

module N
  include NN
  def m1
    p 'N#m1 is called'
  end
  def m4
    p 'N#m4 is called'
  end
  def m5
    p 'N#m5 is called'
  end
end

class A
  def m1
    p 'A#m1 is called'
  end
  def m5
    p 'A#m5 is called'
  end
  def m6
    p 'A#m6 is called'
  end
  def m7
    p 'A#m7 is called'
  end
end

class B < A
  include N
  def m1
    p 'B#m1 is called'
  end
  def m2
    p 'B#m2 is called'
  end
  def m3
    p 'B#m3 is called'
  end
  def m4
    p 'B#m4 is called'
  end
end

class C < B
  include M
  def m1
    p 'C#m1 is called'
  end
end
C.new.m1 # C#m1
C.new.m2 # M#m2 (C includes M)
C.new.m3 # MM#m3 (M includes MM)
C.new.m4 # B#m4 (C inherits B)
C.new.m5 # N#m5 (B includes N)
C.new.m6 # NN#m6 (N includes NN)
C.new.m7 # A#m7 (B inherits A)


p '  ** problem 3-6 **'
module HasName
  def initialize (nameStr)
    @name = nameStr
  end
  def name
    @name 
  end
  def > (b)
    name > b.name
  end
  def initial
    name.split(//)[0]
  end
  def capitalName
    name.upcase
  end
end
class Person
  include HasName
end
class City
  include HasName
end
tom = Person.new('Tom')
jack = Person.new('Jack')
p tom > jack # true
p tom.initial # "T"
p tom.capitalName # "TOM"
tokyo = City.new('Tokyo')
kyoto = City.new('Kyoto')
p tokyo > kyoto # true
p tokyo.initial # "T"
p tokyo.capitalName # "TOKYO"


p '  ** problem 3-7 **'
class Klass7
  def m1
    begin
      m2
    rescue
      p 'rescued in m1'
    end
  end
  def m2
    begin
      m3
    rescue
      p 'rescued in m2'
    end
  end
  def m3
    p 1/0
  end
end
Klass7.new.m1 # "rescued in m2"


p '  ** problem 3-8 **'
class Klass8
  def m1
    begin
      m2
    rescue
      p 'rescued in m1'
    end
  end
  def m2
    begin
      m3
    rescue
      p 'rescued in m2'
      raise
    end
  end
  def m3
    p 1/0
  end
end
Klass8.new.m1
# "rescued in m2": the exception raised in m3 is rescued in m2
# "rescued in m1": the exception raised in m2 is rescued in m1





