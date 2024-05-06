require_relative "./sort_of_name"
# Beskrivning: Denna funktion ber användaren att ange sitt namn och returnerar det.
# Argument : - Ingen -
# Return: String - Namnet på spelaren.
# Exempel: 
#   Exempel 1:
#     puts get_player()
#     # Enter your name
#     # (användarens input)
#     # => "Alice"
#   Exempel 2:
#     puts get_player()
#     # Enter your name
#     # (användarens input)
#     # => "Bob"
#
# By: Anton Angervall & Vincent Thomas
# Date: 05-05-2024

def get_player()
  puts "Enter your name"
  player_name = gets.chomp.to_s
  
  while player_name == ""
      puts "Please enter a valid name"
      player_name = gets.chomp.to_s
  end
  
  return player_name
end

# Beskrivning: Denna funktion ber användaren att ange en tid och returnerar den.
# Argument : - Ingen -
# Return: Float - Spelartiden.
# Exempel: 
#   Exempel 1:
#     puts get_time()
#     # Enter a time , for example 3.0
#     # (användarens input)
#     # => 3.0
#   Exempel 2:
#     puts get_time()
#     # Enter a time , for example 3.0
#     # (användarens input)
#     # => 4.5
#
# By: Anton Angervall & Vincent Thomas
# Date: 05-06-2024
def get_time()
  puts "Enter a time , for example 3.0"
    player_time = gets.chomp.to_f
    
    while player_time == ""
        puts "Please enter a valid time"
        player_time = gets.chomp.to_f
    end

    if player_time <= 0
      raise "du fuska"
    end

    return player_time
  end

# put_player_time
# beskrivning: funktinoen tar emot ett player namn och tid som den sprang på, sen lägger den till det i players.txt, där den sorterar samtidigt som den lägger in i arrayen.
# På så sätt optimiseras tiden det tar att se resultatet på grund av att den redan är sorterad varje gång man ser arrayen.
# Argument:
# - player_name: Det namnet som används för att lägga till i filen
#   - Klass: String
# - tid: Den tiden som spelaren sprang på och som ska läggas in i filen
#   - Klass: Float/Int
# Exampel:
#   - put_player_time("john", 20)
#   - put_player_time("mary", 26)
#   - put_player_time("ange", 30)
# By: Vincent Thomas & Anton Angervall
# Date: 2024-04-29

def put_player_time(player_name, tid)
  file = File.readlines("players.txt", chomp: true)
  real_shit = file

  if file.length == 0
    File.write('players.txt', "#{tid}=#{player_name}")
    return
  end


  if tid < file[0].split("=")[0].to_f
    file.unshift("#{tid}=#{player_name}")
  end

  file.each_with_index do |line, index|
    lines = line.split("=")
    time = lines[0].to_f
    name = lines[1]

    if index == file.length - 1
      File.write('players.txt', "\n#{tid}=#{player_name}", mode: 'a+')
      return
    end

    if time < tid
      next
    end

    file_system = File.readlines("players.txt", chomp: true)
    first_part = file_system[...index]

    if first_part == nil
      first_part = []
    end
    second_part = file_system[index..]
    if second_part == nil
      second_part = []
    end
    file = first_part + ["#{tid}=#{player_name}"] + second_part
    break
  end
  
  file_to_print = file.join("\n")
  File.write("players.txt", file_to_print)
end

put_player_time(get_player(), get_time())