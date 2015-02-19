require 'fast_attributes'

require "coercer/version"

# TODO: make this cleaner
# Monkey patching directly seems ick
module FastAttributes
  class Builder
    def self.coerce(value, type)
      type_cast   = FastAttributes.get_type_casting(type)
      method_body = type_cast.compile_method_body(value, 'value')

      binding.eval <<-EOS, __FILE__, __LINE__ + 1
      #{method_body}
      EOS
    end
  end
end

module Coercer
  module Inclusion
    def Coerce(value, type = String)
      FastAttributes::Builder.coerce(value, type)
    end
  end
end
