# frozen_string_literal: true

RSpec.describe KaiserTutorial do
  context 'print statement' do
    it 'handles proper variables' do
      expect(KaiserTutorial.transpile('Shout Tommy')).to eq 'puts tommy'
    end

    it 'handles common variables' do
      expect(KaiserTutorial.transpile('Shout the world')).to eq 'puts the_world'
    end

    it 'prints a math operation' do
      expect(KaiserTutorial.transpile('Shout the love of the world')).to eq 'puts the_love * the_world'
    end

    it 'throws a syntax error if passed garbage' do
      expect { KaiserTutorial.transpile('Shout the Rock') }.to raise_error SyntaxError
    end

    it 'handles different keywords' do
      expect(KaiserTutorial.transpile('Scream Really Loud')).to eq 'puts really_loud'
    end

    it 'prints the result of a function call' do
      expect(KaiserTutorial.transpile('Shout Joker taking Hostages')).to eq 'puts joker(hostages)'
    end
  end

  context 'input from STDIN' do
    let(:input) do
      <<~END
        Listen to the news
        Shout the news
      END
    end

    it 'transforms into ruby' do
      expect(KaiserTutorial.transpile(input)).to eq <<~RESULT
        print '> '
        __input = STDIN.gets.chomp
        the_news = Integer(__input) rescue __input
        puts the_news
      RESULT
    end
  end
end
