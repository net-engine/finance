# frozen_string_literal: true

require 'rubygems'
require 'flt'
include Flt

DecNum.context.define_conversion_from(BigDecimal) do |x, _context|
  DecNum(x.to_s)
end

DecNum.context.define_conversion_to(BigDecimal) do |x|
  BigDecimal.new(x.to_s)
end

class Numeric
  def to_d
    if instance_of? DecNum
      self
    else
      DecNum to_s
    end
  end
end
