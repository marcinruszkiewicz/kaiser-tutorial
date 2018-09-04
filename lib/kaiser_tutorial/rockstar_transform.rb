module KaiserTutorial
  class RockstarTransform < Parslet::Transform
    @@last_variable = nil

    class << self
      def last_variable=(value)
        @@last_variable = value
      end
    end
        
    rule(variable_name: simple(:str)) do |context|
      self.last_variable = parameterize(context[:str])
      parameterize(context[:str])
    end
    rule(pronoun: simple(:_)) { @@last_variable }

    rule(string_as_number: simple(:str)) { |context| str_to_num(context[:str]) }
    rule(assignment: { left: simple(:left), right: simple(:right) }) { "#{left} = #{right}" }
    rule(print: { output: simple(:output) }) { "puts #{output}" }
    rule(input_variable: simple(:var)) do
      "print '> '\n__input = STDIN.gets.chomp\n#{var} = Integer(__input) rescue input"
    end

    rule(line: simple(:line)) { line }
    rule(lyrics: sequence(:lines)) { lines.size > 1 ? lines.join("\n") + "\n" : lines.join }

    def self.parameterize(string)
      string.to_s.downcase.gsub(/\s+/, '_')
    end

    def self.str_to_num(string)
      string.to_s.split(/\s+/).map { |e| e.length % 10 }.join.to_i
    end
  end
end