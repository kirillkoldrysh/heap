class IoExamples
    def run
        # hello
        # black_hole
        # file_read
        # file_read_all '/tmp/lorem.txt'
        file_write
    end

    def hello
        io = IO.new(1)
        io.puts 'Hello'
    end

    def black_hole
        fd = IO.sysopen('/dev/null', 'w+')
        dev_null = IO.new(fd)
        # puts dev_null.puts('hello').inspect
        # puts dev_null.gets.inspect
        # puts dev_null.close.inspect
        dev_null.puts('hello')
        dev_null.gets
        dev_null.close
    end

    def file_read
        fd = IO.sysopen '/tmp/lorem.txt'
        puts "fd: #{fd}"
        lorem = IO.new(fd)
        
        puts "#{lorem.pos}: #{lorem.gets}"
        puts lorem.eof? ? 'end of file' : 'not end yet'
        puts "#{lorem.pos}: #{lorem.gets}"
        puts lorem.eof? ? 'end of file' : 'not end yet'
        puts "#{lorem.pos}: #{lorem.gets}"
        puts lorem.eof? ? 'end of file' : 'not end yet'
        puts "#{lorem.pos}: #{lorem.gets}"
        puts lorem.eof? ? 'end of file' : 'not end yet'

        lorem.close
    end

    def file_write
        path = '/tmp/ipsum.txt'
        fd = IO.sysopen path, 'w+'
        io = IO.new(fd)

        io.puts 'Hello world'
        io.puts 'goodbye world'

        io.close

        file_read_all path
    end
    
    def file_read_all(path)
        fd = IO.sysopen path
        io = IO.new(fd)

        until io.eof?
            puts io.gets
        end
    end
end

examples = IoExamples.new
examples.run
