defmodule Pokemon do
    @url "https://pokeapi.co/api/v2/"

    def get_pokemon(args) do
      url = make_url(@url, args)
      IO.inspect("URL:  #{url}")
      url
      |> HTTPoison.get()
      |> get_body
    end
    defp make_url(url, []), do: url
    defp make_url(url, [head | tail]), do: make_url(url<>head<>"/", tail )
    defp get_body({:ok, %HTTPoison.Response{ status_code: 200, body: b}}), do: b
    defp get_body({:error, b}), do: {{:error, b} }
end
