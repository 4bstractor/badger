class Float
  def signif(signs)
    Float("%.#{signs}g" % self)
  end
end
