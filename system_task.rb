class SystemTask
    def initialize(io = $stdout)
        @io = io
    end

    def execute
        @io.puts 'preparing to execute'

        @io.puts 'starting first task'
        first_task

        @io.puts 'starting second task'
        second_task

        @io.puts 'execution complete'
    end

    def first_task
        @io.puts 'first task'
    end

    def second_task
        @io.puts 'second task'
    end
end

#
# rspec spec system_task.rb
#
describe SystemTask do
    # test double
    it 'executes tasks' do
        io = double('io', puts: nil)
        system_task = SystemTask.new(io)

        system_task.execute

        # expects things to have happened

        # if we care about the messages, we can also expect on the double
        expect(io).to have_received(:puts).with('preparing to execute')
        expect(io).to have_received(:puts).with('starting first task')
    end

    # StringIO
    it 'executes tasks' do
        io = StringIO.new
        system_task = SystemTask.new(io)

        system_task.execute

        # expect things to have happened

        # if we care about the messages read from the string io
        io.rewind
        expect(io.read).to eq "preparing to execute\nstarting first task\nfirst task\nstarting second task\nsecond task\nexecution complete\n"
    end

    # /dev/null
    it 'executes tasks' do
        io = File.open(File::NULL, 'w')
        system_task = SystemTask.new(io)

        system_task.execute

        # expect things to have happened

        # only use /dev/null if we don't care about messages
    end
end
