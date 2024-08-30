defmodule Api do


  def main(args) do
    [path | _] = args
    case path do
      "pokemon"->
        Pokemon.get_pokemon(args)
       |> extract_body
       |> exibe_resultado


    end
  end
  defp extract_body({:ok, b}), do: Poison.decode(b)
  defp extract_body({:error, error}), do: {:error, error}

  defp exibe_resultado({:ok, b}) do
    id = b["id"]
    name = b["name"]
    IO.inspect("ID:   #{id}")
    IO.inspect("Name: #{name}")
  end

  defp exibe_resultado({:error, erro}) do
    IO.inspect(erro)
  end

end
