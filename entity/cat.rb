class Cat < Base

  def initialize(nick_name)
    super nick_name
    @voice = 'meow'
    @emoji = '🐈'
  end

end
