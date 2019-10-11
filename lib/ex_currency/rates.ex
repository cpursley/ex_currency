defmodule ExCurrency.Rates do
  defstruct from: "", to: "", rate: ""

  def exchange_rates(from, to) when is_binary(to) do
    {from, to} = {String.downcase(from), String.downcase(to)}

    with {:ok, response} <- ExCurrency.Fetcher.fetch(from, to),
         {:ok, [rate]}   <- ExCurrency.Scraper.parse(response.body)
    do
      {:ok, %ExCurrency.Rates{from: from, to: to, rate: rate}}
    else
      {:error, error} ->
        {:error, error}
    end
  end

  def exchange_rates(from, to) when is_list(to) do
    to
    |> Enum.map(&(Task.async(fn -> exchange_rates(from, &1) end)))
    |> Enum.map(&Task.await/1)
  end
end
