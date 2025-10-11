defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @type school :: map()

  @doc """
  Create a new, empty school.
  """
  @spec new() :: school
  def new(), do: %{}

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(school, String.t(), integer) :: {:ok | :error, school}
  def add(db, name, grade) do
    case Map.get(db, name) do
      nil -> {:ok, Map.put(db, name, grade)}
      _ -> {:error, db}
    end
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(school, integer) :: [String.t()]
  def grade(db, grade) do
    db
    |> Enum.filter(fn {_name, student_grade} -> student_grade == grade end)
    |> Enum.map(fn {name, _} -> name end)
    |> Enum.sort()
  end

  @doc """
  Return the names of all the students in the school sorted by grade and name.
  """
  @spec roster(school) :: [String.t()]
  def roster(db) do
    db |> Enum.sort_by(fn {_, v} -> v end) |> Enum.map(fn {name, _} -> name end)
  end
end
