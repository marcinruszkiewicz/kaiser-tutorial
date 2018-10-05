RSpec.describe KaiserTutorial do
  context 'poetic number assignment' do
    it "converts an integer" do
      expect(KaiserTutorial.transpile("Tommy was a lean mean wrecking machine")).to eq "tommy = 14487"
    end

    it "strips leading zeroes from integers" do
      expect(KaiserTutorial.transpile("Jack was carjacking a nice car")).to eq "jack = 143"
    end

    it "converts a decimal number" do
      expect(KaiserTutorial.transpile("Mary was looking. smooth")).to eq "mary = 7.6"
    end

    it "keeps leading zero in decimal part" do
      expect(KaiserTutorial.transpile("Jack was busy. Carjacking a nice car")).to eq "jack = 4.0143"
    end
  end

  context 'assignment statement' do
    it 'assigns common variables' do
      expect(KaiserTutorial.transpile("Put the love into the heart")).to eq "the_heart = the_love"
    end


    it 'assigns proper variables' do
      expect(KaiserTutorial.transpile('Put Love into Heart')).to eq 'heart = love'
    end

    it 'assigns result of math operations' do
      expect(KaiserTutorial.transpile('Put the love with the soul into Heart')).to eq 'heart = the_love + the_soul'
    end
  end
end
