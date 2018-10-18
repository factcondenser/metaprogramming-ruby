# Step 5
module CheckedAttributes
  def self.included(klass)
    klass.extend ClassMacro
  end

  module ClassMacro
    def attr_checked(attribute, &validation)
      define_method "#{attribute}=".to_sym do |value|
        raise 'Invalid attribute' unless validation.call(value)
        instance_variable_set "@#{attribute}", value
      end

      define_method "#{attribute}".to_sym do
        instance_variable_get "@#{attribute}"
      end
    end
  end
end

# Step 4
# class Class
#   def attr_checked(attribute, &validation)
#     define_method "#{attribute}=".to_sym do |value|
#       raise 'Invalid attribute' unless validation.call(value)
#       instance_variable_set "@#{attribute}", value
#     end
#
#     define_method "#{attribute}".to_sym do
#       instance_variable_get "@#{attribute}"
#     end
#   end
# end

# Step 3
# Kernel.send :define_method, :add_checked_attr do |klass, attribute, &validation|
#   klass.class_eval do
#     define_method "#{attribute}=".to_sym do |value|
#       raise 'Invalid attribute' unless validation.call(value)
#       instance_variable_set "@#{attribute}", value
#     end
#
#     define_method "#{attribute}".to_sym do
#       instance_variable_get "@#{attribute}"
#     end
#   end
# end

# Step 2
# Kernel.send :define_method, :add_checked_attr do |klass, attribute|
#   klass.class_eval do
#     define_method "#{attribute}=".to_sym do |value|
#       raise 'Invalid attribute' unless value
#       instance_variable_set "@#{attribute}", value
#     end
#
#     define_method "#{attribute}".to_sym do
#       instance_variable_get "@#{attribute}"
#     end
#   end
# end

# Step 1
# Kernel.send :define_method, :add_checked_attr do |klass, attribute|
#   eval "
#     class #{klass}
#       def #{attribute}=(value)
#         raise 'Invalid attribute' unless value
#         @#{attribute} = value
#       end
#
#       def #{attribute}
#         @#{attribute}
#       end
#     end
#   "
# end
