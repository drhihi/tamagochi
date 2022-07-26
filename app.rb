Dir['entity/*.rb'].each { |file| require_relative file }
require_relative 'view'

class App

  ENTITY_TYPE = [Cat, Dog]
  FOOD_TYPE = [{ name: "meat", level: 5 },
               { name: "dry food", level: 3 }]
  ACTION = [:feed]

  def run

    type = get_type
    nick_name = get_name

    raise ErrorApp unless type < Base

    @entity = type.new nick_name
    View.say @entity

    Thread.new { action }
          .run

    @entity.thread_wait.join

    View.game_over @entity

  end

  private

  def action

    until @entity.death?
      case get_action
      when :feed
        feed
      else
        # type code here
      end
    end

  end

  def feed
    food = get_food
    @entity.feed food[:level]
  end

  def get_type
    type = nil
    while type.nil?
      index = View.type ENTITY_TYPE
      type = ENTITY_TYPE[index] unless index < 0
    end
    type
  end

  def get_name
    nick_name = ''
    while nick_name.empty?
      nick_name = View.name
    end
    nick_name
  end

  def get_action
    action = nil
    while action.nil?
      View.info @entity
      index = View.action ACTION
      action = ACTION[index] unless index < 0
    end
    action
  end

  def get_food
    food = nil
    while food.nil?
      index = View.food FOOD_TYPE
      food = FOOD_TYPE[index] unless index < 0
    end
    food
  end

end

class ErrorApp < StandardError

end

