class Float
  def signif(signs)
    Float("%.#{signs}f" % self)
  end
end
