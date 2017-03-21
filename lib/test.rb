# encoding: utf-8
class Test
  attr_accessor :points

  def initialize
    current_path = File.dirname(__FILE__)
    questions_path = current_path + "/../data/questions.txt"
    unless File.exist?(questions_path)
      abort 'Файл с вопросами не найден!'
    end
    questions_file = File.new(questions_path, "r:UTF-8")
    @questions = questions_file.readlines
    questions_file.close

    @points = 0
    @current_question = 0
  end

  def finished?
    @current_question >= @questions.size
  end

  def next_question
    puts @questions[@current_question]

    user_input = nil
    until user_input == 1 || user_input == 2 || user_input == 3
      puts "введите число: 1 – да, 2 – нет, 3 – иногда, и нажмите Enter"
      user_input = gets.to_i
    end

    @points += 2 if user_input == 1
    @points += 1 if user_input == 3

    # Увеличиваем счетчик заданных вопросов
    @current_question += 1
  end
end
