
def get_player()
  player_name = gets.chomp.to_s
  
  while player_name == ""
      puts "Please enter a valid name"
      player_name = gets.chomp.to_s
  end
  
  return player_name
end

def get_time()
    player_time = gets.chomp.to_i
    
    while player_time == ""
        puts "Please enter a valid time"
        player_time = gets.chomp.to_i
    end
    
    return player_time
  end
  


def put_player_time(player_name, tid)

  file = File.readlines("players.txt", chomp: true)
  real_shit = file

  if file.length == 0
    File.write('players.txt', "#{tid}=#{player_name}", mode: 'a+')
    puts "appending"
    return
  end

  if tid < file[0].split("=")[0].to_i
    file.unshift("#{tid}=#{player_name}\n")
  end
    

  file.each_with_index do |line, index|
    lines = line.split("=")
    time = lines[0].to_i
    name = lines[1]
    if index == file.length - 1
      File.write('players.txt', "\n#{tid}=#{player_name}", mode: 'a+')
      return
    end
    if time > tid
      file = File.readlines("players.txt", chomp: true)
      first_part = file[..index - 1]
      if first_part == nil
        first_part = []
      end
      second_part = file[index..]
      if second_part == nil
        second_part = []
      end

      real_shit = first_part + ["#{tid}=#{player_name}"] + second_part
      file = File.open("players.txt", "w");

      file.write(real_shit.join("\n"))
      return
    end
  end
end

put_player_time(get_player(), get_time())


  