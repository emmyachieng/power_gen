defmodule PowerGen.DataFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PowerGen.Data` context.
  """

  @doc """
  Generate a customer.
  """
  def customer_fixture(attrs \\ %{}) do
    {:ok, customer} =
      attrs
      |> Enum.into(%{
        country_id: 42,
        id_number: "some id_number",
        name: "some name",
        site_id: 42,
        telephone_number: "some telephone_number"
      })
      |> PowerGen.Data.create_customer()

    customer
  end
end
