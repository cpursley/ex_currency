defmodule RatesTest do
  use ExUnit.Case
  alias ExCurrency.Rates
  doctest Rates

  test "should return rate for single conversion" do
    {:ok, usd_to_eur} = Rates.exchange_rates("usd", "eur")
    rate = usd_to_eur.rate

    assert is_binary(rate)
    assert String.length(rate) >= 1
    assert String.contains?(rate, ".")
  end

  test "should return rates for multiple conversions" do
    usd_rates = Rates.exchange_rates("usd", ["eur", "gbp", "rub"])
    {:ok, usd_to_gbp} = hd(usd_rates)
    rate = usd_to_gbp.rate

    assert is_list(usd_rates)
    assert String.length(rate) >= 1
    assert String.contains?(rate, ".")
  end
end
