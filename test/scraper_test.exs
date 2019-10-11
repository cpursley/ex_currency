defmodule ScraperTest do
  use ExUnit.Case
  alias ExCurrency.{Fetcher, Scraper}
  doctest Scraper

  test "should extract the rate from the request body" do
    {:ok, fetch} = Fetcher.fetch("usd", "gbp")
    fetch_body = fetch.body
    {:ok, parse_rate} = Scraper.parse(fetch_body)
    rate = hd(parse_rate)

    assert is_binary(rate)
    assert String.length(rate) >= 1
    assert String.contains?(rate, ".")
  end
end
