defmodule ExCurrency do
  @moduledoc ~S"""
  Fetch currency exchange rates from https://www.investing.com
  """

  @doc """
  Provides a function `exchange_rates/2` for fetching currency exchange rates

  ## Examples

    iex> ExCurrency.exchange_rates("usd", "rub")
    {:ok, %ExCurrency.Rates{from: "usd", rate: "64.2224", to: "rub"}}

    iex> ExCurrency.exchange_rates("usd", ["rub", "gbp", "jpy"])
    [
    ok: %ExCurrency.Rates{from: "usd", rate: "64.2224", to: "rub"},
    ok: %ExCurrency.Rates{from: "usd", rate: "0.7908", to: "gbp"},
    ok: %ExCurrency.Rates{from: "usd", rate: "108.42", to: "jpy"}
    ]
  """
  defdelegate exchange_rates(to, from), to: ExCurrency.Rates, as: :exchange_rates
end
