# encoding: utf-8

class Game

  def initialize(slovo)
   @letters = get_letters(slovo)

    # Schertchik oshibok, ne bolee 7
    @errors = 0

    # Mssiv choroshi i plochich slov
    @good_letters = []
    @bad_letters = []

    # Status igri, 1 = vigral
    @status = 0
  end

  # Mssiv s massivom bukv ugadannogo slova
  def get_letters(slovo)
    if (slovo == nil || slovo == "")
      abort "Задано пустое слово, не о чем играть. Закрываемся."
    else
      slovo = slovo.encode("UTF-8")
    end

    return slovo.split("")
  end

  # Vozvrachaem status igri
  def status
    return @status
  end

  def next_step(bukva)

    if @status == -1 || @status == 1
      return
    end

    if @good_letters.include?(bukva) || @bad_letters.include?(bukva)
      return
    end

    if @letters.include? bukva
      @good_letters << bukva

      if @good_letters.uniq.sort == @letters.uniq.sort
        @status = 1 # статус - победа
      end

    else

      @bad_letters << bukva
      @errors += 1

      if @errors >= 7
        @status = -1
      end
    end
  end

  def ask_next_letter
    puts "\nВведите следующую букву"
    letter = ""
    while letter == "" do
      letter = STDIN.gets.encode("UTF-8").chomp
    end
    # после получения ввода, передаем управление в основной метод игры
    next_step(letter)
  end

  def errors
    return @errors
  end

  def letters
    return @letters
  end

  def good_letters
    return @good_letters
  end

  def bad_letters
    return @bad_letters
  end
end
