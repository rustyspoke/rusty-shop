class CustomerPresent < Arbre::Component
  builder_method :customer_present

  def build(attributes = {})
    super(attributes)

    h1 "Welcome back #{attributes[:customer].name}"
  end
end

