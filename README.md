# TTodo - Simple ToDo App [![Build Status](https://travis-ci.org/nikhilbelchada/ttodo.svg?branch=master)](https://travis-ci.org/nikhilbelchada/ttodo) [![Coverage Status](https://coveralls.io/repos/github/nikhilbelchada/ttodo/badge.svg?branch=master)](https://coveralls.io/github/nikhilbelchada/ttodo?branch=master)

Simple ToDo Cli built as part of learning elixir


## Installation
```elixir
def deps do
  [
    {:ttodo, "~> 0.1.0"}
  ]
end
```

## Build
`sh build.sh`

or

`mix escript.build`

## Usage
Adding a task

`./ttodo --add 'hello there'`


Listing all tasks

`./ttodo --list`

Interactive mode (buggy*)

```
./ttodo --interactive

Ttodo->list
|hello there         | 2019-06-20T16:18:22+00:00 | 2019-06-20T16:18:22+00:00 |

Ttodo->
```

## Todo
- [ ] CLI implementation
  - [x] Add todo `ttodo --add "hello"`
  - [x] List all todos `ttodo --list`
  - [ ] Added interactive mode `ttodo --interactive`
  - [ ] Add todo with due date `ttodo add "hello" due:tomorrow`
  - [ ] Think more :)
