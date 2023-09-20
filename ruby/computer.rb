class Computer
  @@users = {}

  def initialize(username, password)
    @username = username
    @password = password
    @files = {}

    @@users[username] = password
  end

  def create(filename)
    time = Time.now

    @files[filename] = time
    puts "#{time}: User #{@username} add a new file #{filename}"
  end

  def delete(filename)
    unless @files.include?(filename)
      puts "Delete error: #{filename} doesn't exist"
      return
    end
    @files.delete(filename)
  end

  def get_files
    return @files
  end

  def Computer.get_users
    return @@users
  end
end

my_computer = Computer.new('jack', '1234')
my_computer.create('billie')

comp_2 = Computer.new('mack', '222')
comp_2.create('sam')
comp_2.create('bob')

puts Computer.get_users.to_s
puts comp_2.get_files.to_s
comp_2.delete('sam')
puts comp_2.get_files.to_s
comp_2.delete('sam')
puts comp_2.get_files.to_s
comp_2.delete('bob')
puts comp_2.get_files.to_s
