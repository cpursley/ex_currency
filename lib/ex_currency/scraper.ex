defmodule ExCurrency.Scraper do
  def parse(body) do
    body
    |> Floki.find("span#last_last")
    |> extract_rate
  end

  defp extract_rate([{_, _, rate}]), do: {:ok, rate}
  defp extract_rate(_), do: {:error, :unfetchable}
end
