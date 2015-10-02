desc 'Start Pry console'
task :c do
  include LinkedList
  ARGV.clear
  Pry.start
end
