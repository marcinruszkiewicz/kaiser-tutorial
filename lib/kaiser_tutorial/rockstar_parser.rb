module KaiserTutorial
  class RockstarParser < Parslet::Parser
    rule(:proper_word) { match['A-Z'] >> match['A-Za-z'].repeat }
    rule(:proper_variable_name) { (proper_word >> (space >> proper_word).repeat).repeat(1).as(:variable_name) }

    rule(:pronouns) { (str('he') | str('she') | str('it') | str('they') | str('them') | str('her') | str('him') | str('its')).as(:pronoun) }
    rule(:variable_names) { pronouns | proper_variable_name }

    rule(:string_as_number) { match['^\n'].repeat.as(:string_as_number) }

    rule(:poetic_number_keywords) { str('is') | str('was') | str('were') }
    rule(:poetic_number_literal) do
      (
        variable_names.as(:left) >>
        space >> poetic_number_keywords >> space >>
        string_as_number.as(:right)
      ).as(:assignment)
    end

    rule(:print_function) do
      (str('Shout') >> space >> variable_names.as(:output)).as(:print)
    end

    rule(:space) { match[' \t'].repeat(1) }
    rule(:string_input) { print_function | poetic_number_literal | proper_variable_name }

    rule(:eol) { match["\n"] }
    rule(:line) { (string_input >> eol.maybe).as(:line) }
    rule(:lyrics) { line.repeat.as(:lyrics) }
    root(:lyrics)
  end
end