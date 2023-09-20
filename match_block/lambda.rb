class Lambda
  def run
    # run_basic
    # run_with_params
    # run_procs
    # run_procs_with_args
    # run_default_args
    run_method_params
  end

  def run_method_params
    my_proc = proc { puts 'It is proc' }
    my_lambda = -> { puts 'Is is lambda' }

    my_method(my_proc)
    my_method(my_lambda)
  end

  def my_method(useful_arg)
    useful_arg.call
  end

  def run_default_args
    my_proc = proc { |name = 'Bob'| puts "Oh, no, where is #{name}?" }

    my_proc.call
    my_proc.call('Jack')

    my_lambda = ->(name = 'Julie') { puts "Who is #{name}?" }

    my_lambda.call
    my_lambda.call('Sandra')
  end

  def run_procs_with_args
    a_proc = proc { |name, age| puts "Hello, my name is #{name}. I am #{age} years old." }

    a_proc.call('Jack', 43)
  end

  def run_procs
    # a_proc = Proc.new { puts 'this is a proc' }
    a_proc = proc { puts 'this is a proc' }

    a_proc.call
  end

  def run_with_params
    my_name = ->(name) { puts "hello #{name}" }
    my_age = lambda { |age| puts "I am #{age} years old" }

    my_name.call('Kirill')
    my_age.call(29)
  end

  def run_basic
    my_lambda = lambda { puts 'my lambda' }

    other_lambda = -> { puts 'hello from the other side' }

    my_lambda.call
    other_lambda.call
  end
end

l = Lambda.new
l.run
