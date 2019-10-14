# ExCurrency

An Elixir library for fetching currency exchange rates from [www.investing.com](https://www.investing.com)

## Installation

```elixir
def deps do
  [
    {:ex_currency, git: "https://github.com/cpursley/ex_currency.git"}
  ]
end
```

## Usage

Fetch a single exchange rate
```
iex(1)> ExCurrency.exchange_rates("usd", "rub")
{:ok, %ExCurrency.Rates{from: "usd", rate: "64.2224", to: "rub"}}
```

Fetch multiple exchange rates (concurrently)
```
iex(2)> ExCurrency.exchange_rates("usd", ["rub", "gbp", "jpy"])
[
  ok: %ExCurrency.Rates{from: "usd", rate: "64.2224", to: "rub"},
  ok: %ExCurrency.Rates{from: "usd", rate: "0.7908", to: "gbp"},
  ok: %ExCurrency.Rates{from: "usd", rate: "108.42", to: "jpy"}
]
```