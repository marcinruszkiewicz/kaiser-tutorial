RSpec.describe KaiserTutorial do
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

  context 'celsius to fahrenheit example' do
    let(:input) { file_fixture "c_to_f.rock" }

    it 'transpiles code' do
      expect(KaiserTutorial.transpile(input.read)).to eq <<~PROGRAM
        def devilish_secret(a_whisper)
          the_spell = 1.8
          a_demoneye = 32
          the_grimoire = a_whisper * the_spell
          return a_demoneye + the_grimoire
        end # enddef
        
        print '> '
        __input = STDIN.gets.chomp
        a_whisper = Integer(__input) rescue __input
        puts devilish_secret(a_whisper)
      PROGRAM
    end
  end
end
