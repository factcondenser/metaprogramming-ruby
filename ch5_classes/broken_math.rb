class Fixnum
  alias_method :old_plus, :+

  def +(value)
    old_plus(value).old_plus(1)
  end
end
