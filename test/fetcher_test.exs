defmodule FetcherTest do
  use ExUnit.Case
  alias ExCurrency.Fetcher
  doctest Fetcher

  test "should fetch currency conversation rate and return tuple" do
    {from, to} = {"usd", "jpy"}
    fetch_200 = Fetcher.fetch(from, to)
    fetch_404 = Fetcher.fetch(from, "unknown")

    assert elem(fetch_200, 0) == :ok
    assert fetch_404 == {:error, :unknown_currency}
  end
end
