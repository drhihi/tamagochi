class Dog < Base

  def initialize(nick_name)
    super nick_name
    @voice = 'woof'
    @emoji = '🐶'
  end

end
