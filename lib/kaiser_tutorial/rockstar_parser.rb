module KaiserTutorial
  class RockstarParser < Parslet::Parser
    rule(:proper_word) { match['A-Z'] >> match['A-Za-z'].repeat }
    rule(:proper_variable_name) { (proper_word >> (space >> proper_word).repeat).repeat(1).as(:variable_name) }

    rule(:string_as_number) { match['^\n'].repeat.as(:string_as_number) }

    rule(:poetic_number_keywords) { str('is') | str('was') | str('were') }
    rule(:poetic_number_literal) do
      (
        proper_variable_name.as(:left) >>
        space >> poetic_number_keywords >> space >>
        string_as_number.as(:right)
      ).as(:assignment)
    end

    rule(:space) { match[' \t'].repeat(1) }
    rule(:string_input) { poetic_number_literal | proper_variable_name }
    root(:string_input)
  end
end