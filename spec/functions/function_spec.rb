RSpec.describe KaiserTutorial do
  context 'function call' do
    it 'tranforms function name and argument' do
      expect(KaiserTutorial.transpile("Superman taking a whooping")).to eq 'superman(a_whooping)'
    end
  end

  context 'return statement' do
    it 'transform return statement' do
      expect(KaiserTutorial.transpile("Give back a song")).to eq 'return a_song'
    end
  end
end
