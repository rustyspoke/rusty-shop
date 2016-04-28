class Public < Arbre::Component
  builder_method :public

  def build(attributes = {})
    super(attributes)

    h1 'Welcome to the Rusty Spoke'
  end
end
