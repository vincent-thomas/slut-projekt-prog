
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
