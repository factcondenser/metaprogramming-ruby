class MyClass < Array
  def my_method
    'Hello!'
  end
end

MyTabooClass = Class.new(Array) do
  def my_method
    'Hello!'
  end
end
