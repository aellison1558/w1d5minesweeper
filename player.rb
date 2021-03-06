class Player

  attr_accessor :name

  def initialize(name = "Player")
    @name = name
  end

  def flag_or_reveal
    is_valid = false
    until is_valid
      puts "Enter 'r' to reveal location, enter 'f' to flag location"
      input = gets.chomp.downcase
      is_valid = (input == 'f' || input == 'r' || input == 's')
    end
    input
  end

  def get_coordinates(size)
    is_valid = false
    until is_valid
      puts "Enter coordinates of position you want to modify"
      input = gets.chomp.split(",")
      is_valid = (input.all? {|el| el.between?(0.to_s, (size-1).to_s)} )
    end
    input.map(&:to_i)
  end

  def prompt_for_input(size)
    decision = flag_or_reveal
    position = get_coordinates(size)
    [decision, position]
  end
end
