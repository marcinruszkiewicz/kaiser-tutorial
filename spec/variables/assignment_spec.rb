RSpec.describe KaiserTutorial do
  context 'poetic number assignment' do
    it "assigns a number to a variable" do
      expect(KaiserTutorial.transpile("Tommy was a lean mean wrecking machine")).to eq "tommy = 14487"
    end
  end

  context 'assignment statement' do
    it 'assigns variables' do
      expect(KaiserTutorial.transpile("Put the love into the heart")).to eq "the_heart = the_love"
    end
  end
end
