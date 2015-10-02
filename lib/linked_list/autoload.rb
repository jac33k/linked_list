require 'pry-byebug'

def require_files(initial_path = __dir__)
  path = Pathname.new(initial_path)
  path.each_child do |file|
    if File.directory?(file)
      require_files file
    elsif File.extname(file) == '.rb'
      require_relative file.expand_path
    end
  end
end

require_files
