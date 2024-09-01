defmodule Api do


  def main(args) do
    [path | pokemonName] = args
    case path do
      "pokemon"->
        Pokemon.get_pokemon(args)
       |> extract_body
       |> exibe_resultado

      "list_moves" ->
        Pokemon.get_list_moves(pokemonName)
        |> extract_body
        |> exibe_moves


    end
  end
  defp extract_body({:ok, b}), do: Poison.decode(b)
  defp extract_body({:error, error}), do: {:error, error}

  defp exibe_resultado({:ok, b}) do
    id = b["id"]
    name = b["name"]
    IO.inspect("ID:   #{id}")
    IO.inspect("Name: #{name}")
    IO.puts("Abilities: ")
    exibe_abilities(b["abilities"])
    IO.puts("Types: ")
    exibe_types(b["types"])
  end
  defp exibe_resultado({:error, erro}) do
    IO.inspect(erro)
  end

  defp exibe_abilities([head | tail]) do
    name = head["ability"]["name"]
    IO.inspect("  #{name}")
    exibe_abilities(tail)
  end
  defp exibe_abilities([]), do: nil

  defp exibe_types([head | tail]) do
    name = head["type"]["name"]
    IO.inspect("  #{name}")
    IO.puts("")
    exibe_abilities(tail)
  end
  defp exibe_types([]), do: nil


  defp exibe_moves({:ok, b}) do
    moves = b["moves"]
    IO.inspect("Moves: ")
    print_moves(moves)
  end
  defp exibe_moves({:error, erro}) do
    IO.inspect(erro)
  end
  defp print_moves([]), do: nil

  defp print_moves([head | tail]) do
    move_name = head["move"]["name"]
    IO.inspect("Move:  #{move_name}")
    print_moves(tail)
  end

end
