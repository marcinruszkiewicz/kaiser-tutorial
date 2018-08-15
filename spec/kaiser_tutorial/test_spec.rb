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

  context 'transpiles multiple lines' do
    let(:input) do <<~END
        Jane is a dancer
        World was spinning
      END
    end

    it 'makes multiple lines properly' do
      expect(KaiserTutorial.transpile(input)).to eq <<~RESULT
        jane = 16
        world = 8
      RESULT
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
