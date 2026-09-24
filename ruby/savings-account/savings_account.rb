module SavingsAccount
  def self.interest_rate(balance)
    if balance.negative?
      3.213
    elsif balance.zero? || balance < 1000
      0.5
    elsif balance >= 1000 && balance < 5000
      1.621
    elsif balance >= 5000
      2.475
    end
  end

  def self.annual_balance_update(balance)
    (1 + (interest_rate(balance) / 100)) * balance
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    num_years = 0

    while current_balance < desired_balance
      current_balance = annual_balance_update(current_balance)
      num_years += 1
    end

    num_years
  end
end
