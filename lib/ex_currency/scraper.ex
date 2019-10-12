defmodule ExCurrency.Scraper do
  def parse(body) do
    rate = parse_rate(body)

    case is_binary(rate) do
      true ->
        {:ok, rate}
      false ->
        {:error, :unfetchable}
      end
  end

  defp parse_rate(body), do: body |> parse_body |> parse_span

  defp parse_body(body), do: Regex.run(~r/<span.*id=.last_last.*/, body) |> List.first

  defp parse_span(span), do: Regex.run(~r/\>(.*?)\<\/span/, span) |> List.last
end
