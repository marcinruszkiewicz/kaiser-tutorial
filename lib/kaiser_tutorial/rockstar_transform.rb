# frozen_string_literal: true

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

    rule(string_as_number: simple(:str)) do |context|
      if context[:str].to_s.include?('.')
        context[:str].to_s.gsub(/[^A-Za-z\s\.]/, '').split('.').map do |sub|
          str_to_num(sub.strip)
        end.join('.').to_f
      else
        str_to_num(context[:str]).to_i
      end
    end
    rule(assignment: { left: simple(:left), right: simple(:right) }) { "#{left} = #{right}" }
    rule(print: { output: simple(:output) }) { "puts #{output}" }
    rule(input_variable: simple(:var)) do
      "print '> '\n__input = STDIN.gets.chomp\n#{var} = Integer(__input) rescue __input"
    end
    rule(function_call: { function_name: simple(:function_name), argument_name: simple(:argument_name) }) do
      "#{function_name}(#{argument_name})"
    end

    rule(function_definition: {
           function_name: simple(:function_name),
           argument_name: simple(:argument_name),
           function_block: sequence(:function_block_lines)
         }) do |context|
      output = "def #{context[:function_name]}(#{context[:argument_name]})\n"
      output += context[:function_block_lines].map { |l| "  #{l}\n" }.join
      output += "end # enddef\n"
      output
    end

    rule(return_statement: simple(:value)) { "return #{value}" }
    rule(addition: { left: simple(:left), right: simple(:right) }) { "#{left} + #{right}" }
    rule(multiplication: { left: simple(:left), right: simple(:right) }) { "#{left} * #{right}" }

    rule(line: simple(:line)) { line }
    rule(lyrics: sequence(:lines)) { lines.size > 1 ? lines.join("\n") + "\n" : lines.join }

    def self.parameterize(string)
      string.to_s.downcase.gsub(/\s+/, '_')
    end

    def self.str_to_num(string)
      string.to_s.split(/\s+/).map { |e| e.length % 10 }.join
    end
  end
end
