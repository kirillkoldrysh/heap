# frozen_string_literal: true

require 'colorize'

def open_file(relative_path)
  fd = IO.sysopen relative_path
  IO.new(fd)
end

log = open_file('./log.txt')
while line = log.gets
  m = line.match /\[(?<date>[0-9T:.+-]+)\] (?<section>\w+)\.(?<level>\w+): (?<rest>.+)/

  level = m[:level]
  level = level.green if level == 'INFO'
  level = level.red if level == 'CRITICAL'
  level = level.yellow if level == 'DEBUG'
  puts '[' + m[:date].blue + ']' + ' ' + m[:section] + ' ' + level + ' ' + m[:rest]
end
