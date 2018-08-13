require 'parslet'
require 'kaiser_tutorial/rockstar_parser'
require 'kaiser_tutorial/rockstar_transform'

module KaiserTutorial
  def self.parse(input)
    KaiserTutorial::RockstarParser.new.parse(input)
  rescue Parslet::ParseFailed => failure
    puts failure.parse_failure_cause.ascii_tree
  end

  def self.transform(tree)
    KaiserTutorial::RockstarTransform.new.apply(tree)
  end

  def self.transpile(input)
    transform(parse(input))
  end
end
