$my_real_life_account_balance = 0 # Pretend this doesn't exist

$bal = my_real_life_account_balance

class Foo
  def increase_balance()
    bal += 1
  end
end

class Bar
  def decrease_balance()
    bal -= 1
  end
end

def yay(n)
  bal += n
end

def hey_wait(n)
  bal -= n
end