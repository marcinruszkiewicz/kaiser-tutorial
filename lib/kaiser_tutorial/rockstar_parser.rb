module KaiserTutorial
  class RockstarParser < Parslet::Parser
    rule(:proper_word) { match['A-Z'] >> match['A-Za-z'].repeat }
    rule(:proper_variable_name) { (proper_word >> (space >> proper_word).repeat).repeat(1) }

    rule(:common_variable_name) do
      (str('A ') | str('a ') | str('The ') | str('the ')) >> match['[[:lower:]]'].repeat(1)
    end

    rule(:pronouns) { (str('he') | str('she') | str('it') | str('they') | str('them') | str('her') | str('him') | str('its')).as(:pronoun) }
    rule(:variable_names) { (pronouns | common_variable_name | proper_variable_name).as(:variable_name) }

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

    rule(:basic_assignment_expression) do
      (str('Put ') >> variable_names.as(:right) >> str(' into ') >> variable_names.as(:left)).as(:assignment)
    end

    rule(:input) do
      str('Listen to ') >> variable_names.as(:input_variable)
    end

    rule(:function_call) do
      (
        variable_names.as(:function_name) >> str(' taking ') >> variable_names.as(:argument_name)
      ).as(:function_call)
    end

    rule(:return_statement) do
      str('Give back ') >> variable_names.as(:return_statement)
    end

    rule(:space) { match[' \t'].repeat(1) }
    rule(:string_input) do
      return_statement | input | print_function | function_call | basic_assignment_expression | poetic_number_literal | variable_names
    end

    rule(:eol) { match["\n"] }
    rule(:line) { (string_input >> eol.maybe).as(:line) }
    rule(:lyrics) { line.repeat.as(:lyrics) }
    root(:lyrics)
  end
end
