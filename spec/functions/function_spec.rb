RSpec.describe KaiserTutorial do
  context 'function call' do
    it 'tranforms function name and argument' do
      expect(KaiserTutorial.transpile('Superman taking a whooping')).to eq 'superman(a_whooping)'
    end

    it 'throws syntax error if passed something else than a variable name' do
      expect { KaiserTutorial.transpile('Superman taking Batman taking the trash') }.to raise_error SyntaxError
    end
  end

  context 'return statement' do
    it 'returns a variable' do
      expect(KaiserTutorial.transpile('Give back a song')).to eq 'return a_song'
    end

    it 'throws syntax error if passed not a variable name' do
      expect { KaiserTutorial.transpile('Give back Spiderman taking a break') }.to raise_error SyntaxError
    end
  end
end
