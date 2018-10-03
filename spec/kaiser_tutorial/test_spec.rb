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

  context 'common variable name' do
    it 'converts words to a variable name' do
      expect(KaiserTutorial.transpile("the world")).to eq "the_world"
    end
  end

  context 'assignment' do
    it 'assigns variables' do
      expect(KaiserTutorial.transpile("Put the love into the heart")).to eq "the_heart = the_love"
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

  context 'input from STDIN' do
    let(:input) do <<~END
        Listen to the news
        Shout the news
      END
    end

    it 'transforms into ruby' do
      expect(KaiserTutorial.transpile(input)).to eq <<~RESULT
        print '> '
        __input = STDIN.gets.chomp
        the_news = Integer(__input) rescue input
        puts the_news
      RESULT
    end
  end

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
