class Hanoi
  attr_accessor :towers, :solutions, :to_tower, :from_tower, :user_from, :user_to
  def initialize(towerlength)
    @towers = [[], [], []]
    @solution = []
    @to_tower = nil
    @from_tower = nil
    towerlength -= 1
    (0..towerlength).each do |value|
      @towers[0] << value
      @solution << value
    end
    p @towers
    self.game
  end

  def game
    until @towers[2] == @solution
      self.move_from
      self.move_to
      self.move_tower
      p @towers
    end
    puts "CONGRADULATIONS YOU WINNO"
  end

  def move_tower
    if @to_tower.nil? || @from_tower < @to_tower
      @towers[@user_to].unshift(@towers[@user_from].shift)
    else
      puts "That's not a valid move!"
    end
  end

  def move_to
    puts "Which tower would you like to move to?"
    @user_to = gets.chomp.to_i - 1
    @to_tower = @towers[@user_to][0]
  end

  def move_from
    puts "Which tower would you like to move from?"
    @user_from = gets.chomp.to_i - 1
    @from_tower = @towers[@user_from][0]
    until !@from_tower.nil?
      puts "That's not a valid move."
      self.move_from
    end
  end


end


new_game = Hanoi.new(3)
