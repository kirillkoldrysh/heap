class Block
  def run
    # run_logger
    # run_double_vision
    # run_love_language
    # run_mad_libs
    # run_awesome_method
    run_maybe_block
  end

  def run_maybe_block
    maybe_block

    maybe_block {}
  end

  def maybe_block
    if block_given?
      puts 'block party'
    end

    puts 'executed regardless'
  end

  def run_awesome_method
    awesome_method { |key, value| puts "#{key}: #{value}" }
  end

  def awesome_method
    hash = { a: 'apple', b: 'banana', c: 'cookie' }

    hash.each do |key, value|
      yield key, value
    end
  end

  def run_mad_libs
    mad_libs do |adjective, noun|
      puts "I said #{adjective} #{noun}!"
    end
  end

  def mad_libs
    yield('cool', 'beans', 'burrito')
  end

  def run_love_language
    love_language { |lang| puts "I love #{lang}" }
  end

  def love_language
    yield('Ruby')
    yield('Rails')
    yield('Bread')
    yield('Christmas')
    yield('Apples')
    yield('Beatles')
  end

  def run_logger
    logger { puts 'hello from the block' }
    logger do
      p [1, 2, 3]
    end
  end

  def logger
    yield
  end

  def run_double_vision
    double_vision { puts 'How many times you heard someone say?' }
  end

  def double_vision
    yield
    yield
  end
end

bl = Block.new
bl.run
