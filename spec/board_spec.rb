require_relative "../lib/connect_four/board.rb"

describe Board do
  let(:board) { described_class.new }

  describe "attributes" do
    it "has a board" do
      expect(board.board).to be_a(Array)
    end

  end
end
