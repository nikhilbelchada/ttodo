# TTodo - Simple ToDo App

Simple ToDo Cli built as part of learning elixir

## Installation
```elixir
def deps do
  [
    {:ttodo, "~> 0.1.0"}
  ]
end
```

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
