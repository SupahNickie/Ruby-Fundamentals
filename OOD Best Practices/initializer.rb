module Initializer
  def initialize(options)
    options.each do |attribute, value|
      instance_variable_set("@#{attribute}", value)
      eigenclass = class << self; self; end
      eigenclass.class_eval{ attr_accessor attribute }
    end
  end
end
