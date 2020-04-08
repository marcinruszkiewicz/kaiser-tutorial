# frozen_string_literal: true

RSpec.describe KaiserTutorial do
  context 'proper variable name' do
    it 'converts a capitalized word to a variable name' do
      expect(KaiserTutorial.transpile('Tommy')).to eq 'tommy'
    end

    it 'a single lowercased word is not a variable name' do
      expect { KaiserTutorial.transpile('johnny') }.to raise_error SyntaxError
    end

    it 'handles metal umlauts' do
      expect(KaiserTutorial.transpile('Motörhead')).to eq 'motörhead'
    end
  end

  context 'common variable name' do
    it 'converts lowercase words' do
      expect(KaiserTutorial.transpile('the world')).to eq 'the_world'
    end

    it "doesn't convert mixed case words" do
      expect { KaiserTutorial.transpile('the World') }.to raise_error SyntaxError
    end

    it 'handles metal umlauts' do
      expect(KaiserTutorial.transpile('the öyster')).to eq 'the_öyster'
    end
  end

  context 'handles pronouns correctly' do
    let(:input) do
      <<~END
        Jane is a dancer
        Shout it
        World is spinning
        Shout it
      END
    end

    it 'replaces pronouns with last used variable names' do
      expect(KaiserTutorial.transpile(input)).to eq <<~RESULT
        jane = 16
        puts jane
        world = 8
        puts world
      RESULT
    end
  end
end
