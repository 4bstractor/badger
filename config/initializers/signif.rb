class BigDecimal
  def signif(signs)
    BigDecimal("%.#{signs}f" % self)
  end
end
