class CrewCredit < Credit
  alias_attribute :job, :role

  scope :directors, -> { where(job: "Director") }
end
