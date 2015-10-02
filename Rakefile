require_relative 'lib/linked_list'

%w(tasks).each do |directory|
  Pathname.new("lib/#{directory}").each_child { |r| import r }
end
