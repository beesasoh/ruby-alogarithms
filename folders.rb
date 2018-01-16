def read_folder
  exception_names = ['.DS_Store', '.', '..']
  queue = ['*']
  files = {}

  until queue.empty?
    name = queue.first
    puts "Navigating: #{name}"
    document_names = Dir.glob(name)

    document_names.each do |doc|
      next if exception_names.include? doc

      if File.file? doc
        files[doc] = File.size(doc)
      elsif File.directory? doc
        queue.push("#{doc}/*")
      end
    end

    queue.shift
  end

  puts "All files: #{files}"

  files.sort_by { |_key, value| value }.last(10).reverse
end

puts ''
p read_folder
