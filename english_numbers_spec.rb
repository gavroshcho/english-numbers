require_relative "english_numbers"

RSpec.describe EnglishNumber do
  describe "#in_english" do
    it "translate singles" do
      expect(EnglishNumber.new(2).in_english).to eq("two")
    end

    it "translate negative singles" do
      expect(EnglishNumber.new(-2).in_english).to eq("minus two")
    end

    it "translate tens" do
      expect(EnglishNumber.new(20).in_english).to eq("twenty")
    end

    it "translate negative tens" do
      expect(EnglishNumber.new(-20).in_english).to eq("minus twenty")
    end

    it "translate teens" do
      expect(EnglishNumber.new(16).in_english).to eq("sixteen")
    end

    it "translate teens" do
      expect(EnglishNumber.new(-16).in_english).to eq("minus sixteen")
    end

    it "returns nil if the number is bigger than 99" do
      expect(EnglishNumber.new(100).in_english).to eq(nil)
    end

    it "returns nil if the number is smaller than 99" do
      expect(EnglishNumber.new(-100).in_english).to eq(nil)
    end

    it "combines tens and singles" do
      expect(EnglishNumber.new(81).in_english).to eq("eighty-one")
    end

    it "combines negative tens and singles" do
      expect(EnglishNumber.new(-81).in_english).to eq("minus eighty-one")
    end

    it "combines tens and singles and ignores the decimal point" do
      expect(EnglishNumber.new(81.5).in_english).to eq("eighty-one")
    end

    it "combines negative tens and singles and ignores the decimal point" do
      expect(EnglishNumber.new(-81.5).in_english).to eq("minus eighty-one")
    end

    it "translate zero" do
      expect(EnglishNumber.new(0).in_english).to eq("zero")
    end

    it "translate 27.1" do
      expect(EnglishNumber.new(27.1).in_english).to eq("zero")
    end
  end
end
