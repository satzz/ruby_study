# -*- coding: utf-8 -*-
p '  ** problem 1 **'
class Parent
    def foo
        p 'Parent.foo is called'
    end
    def bar
        p 'Parent.bar is called'
    end
end

class Child < Parent
    def bar
        p 'Child.bar is called'
    end
end

child = Child.new
child.foo # parent.foo
child.bar # child.bar


p '  ** problem 2 **'

class GrandChild < Child
end

grandchild = GrandChild.new
grandchild.foo # parent.foo
grandchild.bar # child.bar


p '  ** problem 3 **'

hoge = 'hoge'
p hoge # "hoge"
hoge = 3
p hoge # 3


p '  ** problem 4 **'

class Callee1
    def m
        p 'Callee1.m is called'
    end
end

class Callee2
    def m
        p 'Callee2.m is called'
    end
end

class Caller
    def m (obj)
        obj.m
    end
end

i = Caller.new
i.m(Callee1.new) # Callee1.m
i.m(Callee2.new) # Callee2.m

p '  ** problem 5 **'

=begin
# the program dies because:

class Ex1
    def initialize(nameStr)
        @birth = Time.now.to_f; name = nameStr
        # the local variable <name> dies here.
    end
    def profile
        p 'my name is ' + name # <name> is not defined here.
        p 'I was born ' + (Time.now.to_f - @birth).to_s + 'seconds ago'
    end
end
a = Ex1.new('one')
a.profile
b = Ex1.new('two')
b.profile
a.profile

=end


p '  ** problem 6 **'

str = 123.to_s + '456'
n   = '123'.to_i + 456
p str # "123456"
p n # 579


