def gen_numbers
  lot_numbers = []
  7.times do
    number = rand(51)
    number = rand(51) until number > 0

    number = rand(51) if lot_numbers.include?(number)

    lot_numbers.push(number)
  end
  lot_numbers.sort
end

def check_numbers
  game = 1
  10.times do
    start_time = Time.now
    puts "\n\nGame # #{game}"
    game += 1
    winning_numbers = gen_numbers
    play_numbers = pick_numbers
    count = 0

    until play_numbers.include?(winning_numbers) 
      play_numbers = pick_numbers
      count += 1
    end

    puts "\nIt took #{pretty_time(Time.now.to_i, start_time.to_i)} to find the winning numbers."
    puts "\nIt took #{pretty_number(count)} guesses to find the right number."
    print "\nPlay numbers: #{play_numbers}."
    print "\nWinning numbers: #{winning_numbers}."
  end
  puts "\n\n"
end

def pick_numbers
  set_of_numbers = []
  3.times do
    set_of_numbers.push(gen_numbers)
  end
  set_of_numbers
end

def pretty_number(num)
  new_num = ''
  into_three = num.to_s.length / 3
  i = -3
  j = -1
  into_three.times do
    last_three = num.to_s[i..j]
    new_num.prepend(",", last_three)
    i -= 3
    j -= 3
  end

  new_num.prepend(num.to_s[0..into_three - 1]) if into_three > 0
  new_num
end

def pretty_time(current_time, start_time)
  time_in_seconds = current_time - start_time

  minutes = time_in_seconds / 60

  if minutes.zero?
    seconds = time_in_seconds - (minutes * 60)
    return time_taken = "#{seconds} seconds"
  elsif time_in_seconds % 60 > 0
    seconds = time_in_seconds - (minutes * 60)
    time_taken = "#{minutes} minutes and #{seconds} seconds"
  else
    time_taken = "#{minutes} minutes"
  end
  time_taken
end

check_numbers
