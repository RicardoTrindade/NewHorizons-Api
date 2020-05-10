defmodule Newhorizonsapi.AnimalsTest do
  use Newhorizonsapi.DataCase

  alias Newhorizonsapi.Animals

  describe "fishes" do
    alias Newhorizonsapi.Animals.Fish

    @valid_attrs %{name: "some name", price: 42}
    @update_attrs %{name: "some updated name", price: 43}
    @invalid_attrs %{name: nil, price: nil}

    def fish_fixture(attrs \\ %{}) do
      {:ok, fish} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Animals.create_fish()

      fish
    end

    test "list_fishes/0 returns all fishes" do
      fish = fish_fixture()
      assert Animals.list_fishes() == [fish]
    end

    test "get_fish!/1 returns the fish with given id" do
      fish = fish_fixture()
      assert Animals.get_fish!(fish.id) == fish
    end

    test "create_fish/1 with valid data creates a fish" do
      assert {:ok, %Fish{} = fish} = Animals.create_fish(@valid_attrs)
      assert fish.name == "some name"
      assert fish.price == 42
    end

    test "create_fish/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Animals.create_fish(@invalid_attrs)
    end

    test "update_fish/2 with valid data updates the fish" do
      fish = fish_fixture()
      assert {:ok, %Fish{} = fish} = Animals.update_fish(fish, @update_attrs)
      assert fish.name == "some updated name"
      assert fish.price == 43
    end

    test "update_fish/2 with invalid data returns error changeset" do
      fish = fish_fixture()
      assert {:error, %Ecto.Changeset{}} = Animals.update_fish(fish, @invalid_attrs)
      assert fish == Animals.get_fish!(fish.id)
    end

    test "delete_fish/1 deletes the fish" do
      fish = fish_fixture()
      assert {:ok, %Fish{}} = Animals.delete_fish(fish)
      assert_raise Ecto.NoResultsError, fn -> Animals.get_fish!(fish.id) end
    end

    test "change_fish/1 returns a fish changeset" do
      fish = fish_fixture()
      assert %Ecto.Changeset{} = Animals.change_fish(fish)
    end
  end
end
