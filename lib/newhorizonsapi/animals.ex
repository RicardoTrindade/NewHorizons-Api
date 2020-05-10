defmodule Newhorizonsapi.Animals do
  @moduledoc """
  The Animals context.
  """

  import Ecto.Query, warn: false
  alias Newhorizonsapi.Repo

  alias Newhorizonsapi.Animals.Fish

  @doc """
  Returns the list of fishes.

  ## Examples

      iex> list_fishes()
      [%Fish{}, ...]

  """
  def list_fishes do
    Repo.all(Fish)
  end

  @doc """
  Gets a single fish.

  Raises `Ecto.NoResultsError` if the Fish does not exist.

  ## Examples

      iex> get_fish!(123)
      %Fish{}

      iex> get_fish!(456)
      ** (Ecto.NoResultsError)

  """
  def get_fish!(id), do: Repo.get!(Fish, id)

  def get_fish_by_name(name), do: Repo.get_by!(Fish, name: name)

  def get_fish_over_price(price) do
    query =
      from(
        fish in Fish,
        where: fish.price >= ^price
      )

    query
    |> Repo.all()
  end

  @doc """
  Creates a fish.

  ## Examples

      iex> create_fish(%{field: value})
      {:ok, %Fish{}}

      iex> create_fish(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_fish(attrs \\ %{}) do
    %Fish{}
    |> Fish.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a fish.

  ## Examples

      iex> update_fish(fish, %{field: new_value})
      {:ok, %Fish{}}

      iex> update_fish(fish, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_fish(%Fish{} = fish, attrs) do
    fish
    |> Fish.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a fish.

  ## Examples

      iex> delete_fish(fish)
      {:ok, %Fish{}}

      iex> delete_fish(fish)
      {:error, %Ecto.Changeset{}}

  """
  def delete_fish(%Fish{} = fish) do
    Repo.delete(fish)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking fish changes.

  ## Examples

      iex> change_fish(fish)
      %Ecto.Changeset{data: %Fish{}}

  """
  def change_fish(%Fish{} = fish, attrs \\ %{}) do
    Fish.changeset(fish, attrs)
  end
end
