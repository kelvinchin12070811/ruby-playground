# frozen_string_literal: true

def yes
  require_relative './reinit_file'
end

if ENV['FEATURE_RESET'] != '1'
  puts 'Feature not enabled, you may enable it by setting the environment varaible FEATURE_RESET to 1.'
  puts 'Beware this is a destructive feature and will wipe out all your data.'
  exit
end

puts 'Warning! This is a destructive feature and will wipe out all your data in the playground.'
puts ''
puts 'To download a copy of your data, you can archive everything in the playground folder then use the live server'
puts 'extension of vs code to serve the directory and download it. You may also use another method to backup them'
puts 'including using a git repository.'
puts ''
puts 'Are you sure you want to proceed? [Y/n]'

answer = gets.chomp

case answer
when 'Y', 'y'
  yes
when 'N', 'n'
  exit
else
  puts 'Invalid input'
end
