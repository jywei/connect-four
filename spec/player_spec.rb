require_relative "../lib/connect_four/player.rb"

describe Player do
  let(:player1) { described_class.new(name: "Roy", symbol: "X") }
  let(:player2) { described_class.new(name: "Wei", symbol: "O") }

  describe "attributes" do
    it "has a name" do
      expect(player1.name).to eq "Roy"
    end

    it "allows reading and writing for :name" do
      player2.name = "Andy"
      expect(player2.name).to eq "Andy"
    end

    it "has a symbol" do
      expect(player1.symbol).to eq "X"
    end
  end
end
