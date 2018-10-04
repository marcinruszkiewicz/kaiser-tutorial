RSpec.describe KaiserTutorial do
  context 'addition' do
    it 'works with common variables' do
      expect(KaiserTutorial.transpile('the man with a cause')).to eq 'the_man + a_cause'
    end

    it 'works with proper variables' do
      expect(KaiserTutorial.transpile('Jamie with Gun')).to eq 'jamie + gun'
    end

    it 'throws syntax error otherwise' do
      expect { KaiserTutorial.transpile('Jamie with Gun taking Names') }.to raise_error SyntaxError
    end
  end

  context 'multiplication' do
    it 'works with common variables' do
      expect(KaiserTutorial.transpile('the rest of the world')).to eq 'the_rest * the_world'
    end

    it 'works with proper variables' do
      expect(KaiserTutorial.transpile('Jake of Warsaw')).to eq 'jake * warsaw'
    end

    it 'throws syntax error otherwise' do
      expect { KaiserTutorial.transpile('the height of a mountain taking Birds') }.to raise_error SyntaxError
    end
  end
end
