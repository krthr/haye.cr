# Haye.cr

> Based on the [javascript version](https://github.com/poppinss/haye).

Haye is a simple super fast string expression parser. In support `pipe` and `qs` string expressions ( explained below ).

### Pipe expression
The pipe based expression is very popular in Laravel community, due to their [Validation engine](https://laravel.com/docs/validation), and same is adopted by [Indicative](http://indicative.adonisjs.com).


#### Syntax example:

```cr
required|email|max:4|range:10,30
```

1. Each item is separated by `|`
2. The values are defined after `:`
3. Multiple values are separated by `,`.
4. White spaces in keys are trimmed.

---

## Installation

1. Add the dependency to your `shard.yml`:

```yaml
dependencies:
  haye.cr:
    github: krthr/haye.cr
```

2. Run `shards install`

## Usage

```crystal
require "haye.cr"
```

#### Pipe -> Array

```cr
expression = 'required|email:unique,users'
parsed = Haye.fromPipe(expression) # Haye.fromPipe(expression, Haye::PresenterTypes::Array)
```

Output (`Haye::Presenters::Node[]`)
```
[
  #<Haye::Presenters::Node:0x7f11fd891e40 
    @name="required", 
    @args=[]
  >, 
  #<Haye::Presenters::Node:0x7f11fd891de0 
    @name="email", 
    @args=["unique", "users"]
  >
]
```

#### Pipe -> Hash

```cr
expression = 'required|email:unique,users'
parsed = Haye.fromPipe(expression, Haye::PresenterTypes::Hash)
```

Output (`Hash`)
```cr
{
  "required" => [], 
  "email" => ["unique", "users"]
}
```

## Contributing

1. Fork it (<https://github.com/krthr/haye.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [krthr](https://github.com/krthr) - creator and maintainer
