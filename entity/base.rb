class Base
  attr_reader :nick_name, :voice, :level_hungry, :thread_wait
  LEVEL_HUNGRY = 10
  TIME_WAIT = 3

  def initialize(nick_name)
    @nick_name = nick_name
    @level_hungry = 3

    @thread_wait = Thread.new { wait }
          .run
  end

  def feed(level_food)
    @level_hungry += level_food
  end

  def hungry?
    @level_hungry > LEVEL_HUNGRY
  end

  def death?
    @level_hungry < -LEVEL_HUNGRY
  end

  def info
    "\033[0;32m#{self.class} #{@emoji} \"#{@nick_name}\"\033[0m\n"\
    "level hungry: #{@level_hungry}\n"
  end

  private

  def wait
    until death?
      sleep TIME_WAIT
      @level_hungry -= 1
    end
  end

end
