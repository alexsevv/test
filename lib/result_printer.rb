# encoding: utf-8

class ResultPrinter

  def initialize
    current_path = File.dirname(__FILE__)
    result_path = current_path + "/../data/result.txt"
    unless File.exist?(result_path)
      abort 'Файл с ответами не найден!'
    end
    result_file = File.new(result_path, "r:UTF-8")
    @results = result_file.readlines
    result_file.close
  end

  def print_result(test)
    puts "\n\nРезультат теста (всего баллов - #{test.points}):"
    case test.points.to_i
      when (30..32) then puts @results[0]
      when (25..29) then puts @results[1]
      when (19..24) then puts @results[2]
      when (14..18) then puts @results[3]
      when (9..13) then  puts @results[4]
      when (4..8) then  puts @results[5]
      else
        puts @results[6]
    end
  end
end
