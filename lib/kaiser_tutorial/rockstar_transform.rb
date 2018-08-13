module KaiserTutorial
  class RockstarTransform < Parslet::Transform
    rule(variable_name: simple(:str)) { |context| parameterize(context[:str]) }
    rule(string_as_number: simple(:str)) { |context| str_to_num(context[:str]) }
    rule(assignment: { left: simple(:left), right: simple(:right) }) { "#{left} = #{right}" }

    def self.parameterize(string)
      string.to_s.downcase.gsub(/\s+/, '_')
    end

    def self.str_to_num(string)
      string.to_s.split(/\s+/).map { |e| e.length % 10 }.join.to_i
    end
  end
end