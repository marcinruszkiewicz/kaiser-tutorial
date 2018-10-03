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
end
