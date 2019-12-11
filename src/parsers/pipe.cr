module Haye
  module Parsers
    def self.pipe(
      chars : String,
      presenter : Presenters::ArrayPresenter | Presenters::HashPresenter
    )
      presenter.add

      i = 0
      target_prop = "name"

      while i < chars.size
        char = chars.char_at(i)

        if char == '\u003A' || char == '\u002C'
          # if : or ,

          target_prop = "arg"
          presenter.shift_value
        elsif char == '\u007C'
          # if |

          target_prop = "name"
          presenter.add
        elsif target_prop == "arg"
          presenter.append_value(char)
        else
          presenter.append_key(char)
        end

        i += 1
      end

      presenter
    end
  end
end
