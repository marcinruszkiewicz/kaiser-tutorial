RSpec.describe KaiserTutorial do
  context 'print statement' do
    it "prints a variable" do
      expect(KaiserTutorial.transpile("Shout Tommy")).to eq "puts tommy"
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
end
