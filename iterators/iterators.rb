def conversation 
  puts "Hello"
  yield
  puts "Goodbye"
end

conversation { puts "Good to meet you!" }

def n_times(n)
  1.upto(n) do |count|
    yield count
  end
end

n_times(8) do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end