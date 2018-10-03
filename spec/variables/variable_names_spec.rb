RSpec.describe KaiserTutorial do
  context 'proper variable name' do
    it 'converts a word to a variable name' do
      expect(KaiserTutorial.transpile("Tommy")).to eq "tommy"
    end
  end

  context 'common variable name' do
    it 'converts words to a variable name' do
      expect(KaiserTutorial.transpile("the world")).to eq "the_world"
    end
  end

  context 'handles pronouns correctly' do
    let(:input) do <<~END
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
