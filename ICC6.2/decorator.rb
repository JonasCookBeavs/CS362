def activate()
  puts "Activated!"
end

def decorated_counter(f)
  count = 0
  -> () {
    count += 1
    f.call
    puts count
  }
end

a = decorated_counter(method(:activate))

a.call()
a.call()
a.call()