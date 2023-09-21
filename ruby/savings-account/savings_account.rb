module SavingsAccount
  def self.interest_rate(balance)
    return 3.213 if balance.negative?

    case balance
    when 0...1_000
      0.5
    when 1_000...5_000
      1.621
    else
      2.475
    end
  end

  def self.annual_balance_update(balance)
    ((interest_rate(balance) * balance) / 100) + balance
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    year = 0

    while desired_balance >= current_balance
      current_balance = annual_balance_update(current_balance)
      year += 1
    end
    year
  end
end

if $PROGRAM_NAME == __FILE__
  puts SavingsAccount.interest_rate(200.75)
  puts SavingsAccount.annual_balance_update(200.75)
  puts SavingsAccount.years_before_desired_balance(100.0, 125.8)
end