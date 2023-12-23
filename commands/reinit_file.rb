# frozen_string_literal: true

require('fileutils')

LIBS_TO_INSTALL = %w[
  solargraph
  rubocop
].freeze

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
src_file = File.open('main.rb', 'w+')
src_file.puts '# frozen_string_literal: true'
src_file.puts ''
src_file.puts 'puts \'Hello World!\''
src_file.close

puts 'Setting up bundler...'
system('bundle init')

LIBS_TO_INSTALL.each do |lib|
  system("bundle add #{lib} -g development --skip-install")
end

system('bundle install')
puts 'Done!'
