# frozen_string_literal: true

require('fileutils')

Dir.chdir('/home/playground')

puts 'Removing all files in the playground folder...'

Dir.glob('./*').each do |file|
  FileUtils.remove_entry_secure(file)
end

Dir.glob('./.*').each do |file|
  next if ['./.', './..'].include?(file)

  FileUtils.remove_entry_secure(file)
end

puts 'Initializing bundler project...'
puts 'Copying assets to the playground folder...'
FileUtils.cp_r('/app/assets/.', '.')
system('bundle install')
puts 'Done!'
