defmodule ExCurrency.Fetcher do
  @base_url "https://www.investing.com"

  defp url(from, to), do: "#{@base_url}/currencies/#{from}-#{to}"

  def fetch(from, to) do
    url(from, to)
    |> HTTPoison.get
    |> handle
  end

  # watch out for 406 status_code (might be from getting banned!!!)
  defp handle({:ok, %{status_code: 200} = response}), do: {:ok, response}
  defp handle({:ok, %{status_code: 404}}),            do: {:error, :unknown_currency}
  defp handle({:error, _error}),                      do: {:error, :unfetchable}
end
