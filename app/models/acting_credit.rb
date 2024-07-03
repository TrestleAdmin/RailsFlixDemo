class ActingCredit < Credit
  alias_attribute :character, :role

  def self.top_billing(n=5)
    includes(:person).first(n)
  end
end
