class C
  def a_method
    'C#a_method()'
  end

  class << self
    def a_class_method
      'C.a_class_method()'
    end
  end
end

class D < C; end

obj = D.new
obj.a_method

class << obj
  def a_singleton_method
    'obj#a_singleton_method()'
  end
end
