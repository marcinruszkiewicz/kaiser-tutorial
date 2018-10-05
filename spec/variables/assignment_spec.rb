RSpec.describe KaiserTutorial do
  context 'poetic number assignment' do
    it "assigns a number to a variable" do
      expect(KaiserTutorial.transpile("Tommy was a lean mean wrecking machine")).to eq "tommy = 14487"
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
