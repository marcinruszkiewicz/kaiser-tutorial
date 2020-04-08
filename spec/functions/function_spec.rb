# frozen_string_literal: true

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

    it 'returns a result of a math operation' do
      expect(KaiserTutorial.transpile('Give back a song with a message')).to eq 'return a_song + a_message'
    end

    it 'throws syntax error if passed not a variable name' do
      expect { KaiserTutorial.transpile('Give back the Message') }.to raise_error SyntaxError
    end
  end

  context 'function definition' do
    let(:one_argument_function) do
      <<~END
        Midnight takes Hate
        Shout Desire
        Give back Desire
      END
    end

    it 'makes a function definition' do
      expect(KaiserTutorial.transpile(one_argument_function)).to eq <<~RESULT
        def midnight(hate)
          puts desire
          return desire
        end # enddef
      RESULT
    end
  end
end
