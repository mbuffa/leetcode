defmodule Solution do
  @spec unique_paths(m :: integer, n :: integer) :: integer
  def unique_paths(m, n) do
    paths = initialize(m, n)
    coordinates = get_all_tiles(m, n)

    Enum.reduce(coordinates, paths, fn {mi, ni}, acc ->
      explore(acc, mi, ni)
    end)
    |> List.flatten()
    |> List.last()
  end

  defp initialize(m, n) do
    for i <- 0..m do
      for j <- 0..n do
        if i == 1 and j == 1, do: 1, else: 0
      end
    end
  end

  defp get_all_tiles(m, n) do
    for mi <- 0..m do
      for ni <- 0..n, do: {mi, ni}
    end
    |> List.flatten()
  end

  def explore(paths, mi, ni) do
    current = Enum.at(paths, mi) |> Enum.at(ni)
    paths
    |> List.update_at(mi + 1, fn row -> List.update_at(row, ni, &(&1 + current)) end)
    |> List.update_at(mi, fn row -> List.update_at(row, ni + 1, &(&1 + current)) end)
  end
end

Solution.unique_paths(0, 0) |> IO.inspect
Solution.unique_paths(1, 1) |> IO.inspect
Solution.unique_paths(2, 2) |> IO.inspect
Solution.unique_paths(3, 2) |> IO.inspect
Solution.unique_paths(3, 7) |> IO.inspect
