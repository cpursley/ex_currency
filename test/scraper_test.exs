defmodule ScraperTest do
  use ExUnit.Case
  alias ExCurrency.{Fetcher, Scraper}
  doctest Scraper

  test "should extract the rate from the request body" do
    {:ok, fetch} = Fetcher.fetch("usd", "gbp")
    fetch_body = fetch.body
    {:ok, rate} = Scraper.parse(fetch_body)

    assert is_binary(rate)
    assert String.length(rate) >= 1
    assert String.contains?(rate, ".")
  end
end
