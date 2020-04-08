# frozen_string_literal: true

require 'thor'

module KaiserTutorial
  class CLI < Thor
    desc 'execute FILE', 'transpiles and runs a .rock FILE'
    def execute(filename)
      file = File.read filename
      output = KaiserTutorial.transpile(file)

      instance_eval output
      say
    end
  end
end
