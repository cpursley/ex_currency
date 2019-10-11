# ExCurrency

An Elixir library for fetching currency exchange rates from [www.investing.com](https://www.investing.com)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `xeee` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_currency, "~> 0.1.0"}
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