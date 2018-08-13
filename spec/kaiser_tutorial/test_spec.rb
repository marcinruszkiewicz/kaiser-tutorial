RSpec.describe KaiserTutorial do
  context 'proper variable name' do
    it 'converts a word to a variable name' do
      expect(KaiserTutorial.transpile("Tommy")).to eq "tommy"
    end
  end

  context 'poetic number assignment' do
    it "assigns a number to a variable" do
      expect(KaiserTutorial.transpile("Tommy was a lean mean wrecking machine")).to eq "tommy = 14487"
    end
  end

  context 'print statement' do
    it "prints a variable" do
      expect(KaiserTutorial.transpile("Shout Tommy")).to eq "puts tommy"
    end
  end
end
