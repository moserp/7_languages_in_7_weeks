unless ARGV[0] and ARGV[1]
 puts "You must specifiy the file and text to match as commandline arguments" unless ARGV[0] and ARGV[1]
 exit
end

File.open(ARGV[0]) do |f|
  while (line = f.gets) do
    puts line if line =~ %r/#{ARGV[1]}/
  end
end
