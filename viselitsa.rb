# encoding: utf-8

require_relative "game.rb"
require_relative "result_printer.rb"
require_relative "word_reader.rb"

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__
#
  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end


current_path = File.dirname(__FILE__)

puts "Игра виселица. Версия 3. C чтением данных из файлов. \n\n"

printer = ResultPrinter.new

word_reader = WordReader.new

words_file_name = current_path + "/data/words.txt"

game = Game.new(word_reader.read_from_file(words_file_name))

while game.status == 0 do
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)