class Float
  def signif(signs)
    Float("%.#{signs}f" % self)
  end
end

class BigDecimal
  def signif(signs)
    BigDecimal("%.#{signs}f" % self)
  end
end
