# heavily references hangman code

defmodule Battleship.Game do
  def new do
    %{
      chalShips: %{"two" => %{"1" => "05", "2" => "06"}},
      chalGuesses: %{},
      otherShips: %{"two" => %{"1" => "55", "2" => "56"}},
      otherGuesses: %{},
      gameCode: "ABCD"
    }
  end


  def client_view(game, player) do
#    if player == "challenger" do

    %{
      myShips: chalShips,
      guesses: chalGuesses
    }
#    end

  end

  # correct and incorrect guesses about the other player's ships
  def skeleton_other(ships, guesses) do
    Enum.map ships, fn ship ->
      Enum.map ship, fn dot ->
        if Enum.member?(guesses, dot) do
          "H"
        else
          " "
        end
      end
    end
  end



#  def guess(game, coordinate, player) do

#  end
end
