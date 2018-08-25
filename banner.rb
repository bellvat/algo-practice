class Banner
  def initialize(text)
    @text = text
  end
  def +@
    @text.upcase
  end
  def -@
    @text.downcase
  end
end
