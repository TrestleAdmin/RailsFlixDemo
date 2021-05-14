class ActingCredit < Credit
  alias_attribute :character, :role

  def self.top_billing
    includes(:person).first(5)
  end
end
