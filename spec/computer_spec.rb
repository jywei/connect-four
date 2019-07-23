describe Computer do
  let(:computer_player1) { described_class.new(name: "Roy", symbol: "X") }
  let(:computer_player2) { described_class.new(name: "Wei", symbol: "O") }

  describe "attributes" do
    it "has a name" do
      expect(computer_player1.name).to eq "Roy"
    end

    it "allows reading and writing for :name" do
      computer_player2.name = "Andy"
      expect(computer_player2.name).to eq "Andy"
    end

    it "has a symbol" do
      expect(computer_player1.symbol).to eql("X")
    end
  end
end
