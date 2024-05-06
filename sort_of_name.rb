# Beskrivning: Denna funktion sorterar en array av strängar efter det andra värdet som separeras av "=" och returnerar den sorterade arrayen.
# Argument 1: Array - En array av strängar som ska sorteras.
# Return: Array - Den sorterade arrayen.
# Exempel: 
#   Exempel 1:
#     puts sort_array(["5.6=John", "3.5=Anita", "1.5=New York"])
#     # => [ "3.5=anita",  "3.2=John", "1.5=New York"]
#
# By: Anton Angervall & Vincent Thomas
# Date: 05-06-2024
def sort_array(name)
  return name.sort_by { |name| name.split("=")[1] }
end

def file_name(names)
  string = ''
  index = 0 

  while index < names.length
    p names[index]
    string += names[index] + "\n"  
  index+= 1    
  end
 
  File.open('names.txt', 'a') do |fa|
    fa.write(string)
  end
end

def new_array()
  file = File.readlines("players.txt", chomp: true)
  new_array = []
  sort_array = sort_array(file)
 file_name(sort_array)
end

new_array()
