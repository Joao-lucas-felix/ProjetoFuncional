defmodule Api do


  def main(args) do
    Pokemon.get_pokemon(args)
    |> Poison.decode
    |> exibe_resultado
  end

  defp exibe_resultado({:ok, b}) do
    id = b["id"]
    name = b["name"]
    IO.inspect("ID:   #{id}")
    IO.inspect("Name: #{name}")
  end

end
