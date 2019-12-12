require "./parsers/**"
require "./presenters/**"
require "json"

module Haye
  VERSION = "0.1.0"

  extend self

  enum PresenterTypes
    Array
    Hash
  end

  def fromPipe(expression : String, type : PresenterTypes = PresenterTypes::Array)
    type.array? ? Parsers.pipe(expression, Presenters::ArrayPresenter.new).to_array : Parsers.pipe(expression, Presenters::HashPresenter.new).to_hash
  end
end
