# frozen_string_literal: true

# This is the Player class, used to instantiate a new player.
class Player
  attr_accessor :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end
