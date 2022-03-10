defmodule Solution do
  def trap([]), do: 0
  def trap([_]), do: 0
  def trap(height) do
    height
    |> Enum.map_reduce(0, fn h, acc ->
      acc = if h > acc, do: h, else: acc
      {{h, acc}, acc}
    end)
    |> Tuple.to_list()
    |> List.first()
    |> Enum.reverse()
    |> Enum.reduce(%{right: 0, total: 0}, fn {h, left}, %{right: right, total: total} ->
      right = if h > right, do: h, else: right

      lowest_boundary = Enum.min([left, right])
      total = if h < lowest_boundary, do: total + lowest_boundary - h, else: total

      %{right: right, total: total}
    end)
    |> Map.get(:total)
  end
end

IO.inspect Solution.trap([0]) # 0
IO.inspect Solution.trap([2, 0, 1]) # 1
IO.inspect Solution.trap([2, 0, 2]) # 2
IO.inspect Solution.trap([0,1,0,2,1,0,1,3,2,1,2,1]) # 6
IO.inspect Solution.trap([4,2,0,3,2,5]) # 9
