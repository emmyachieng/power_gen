defmodule PowerGen.DataTest do
  use PowerGen.DataCase

  alias PowerGen.Data

  describe "customers" do
    alias PowerGen.Data.Customer

    import PowerGen.DataFixtures

    @invalid_attrs %{country_id: nil, date_of_birth: nil, id_number: nil, name: nil, site_id: nil, telephone_number: nil}

    test "list_customers/0 returns all customers" do
      customer = customer_fixture()
      assert Data.list_customers() == [customer]
    end

    test "get_customer!/1 returns the customer with given id" do
      customer = customer_fixture()
      assert Data.get_customer!(customer.id) == customer
    end

    test "create_customer/1 with valid data creates a customer" do
      valid_attrs = %{country_id: 42, date_of_birth: ~D[2023-06-15], id_number: "some id_number", name: "some name", site_id: 42, telephone_number: "some telephone_number"}

      assert {:ok, %Customer{} = customer} = Data.create_customer(valid_attrs)
      assert customer.country_id == 42
      assert customer.date_of_birth == ~D[2023-06-15]
      assert customer.id_number == "some id_number"
      assert customer.name == "some name"
      assert customer.site_id == 42
      assert customer.telephone_number == "some telephone_number"
    end

    test "create_customer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_customer(@invalid_attrs)
    end

    test "update_customer/2 with valid data updates the customer" do
      customer = customer_fixture()
      update_attrs = %{country_id: 43, date_of_birth: ~D[2023-06-16], id_number: "some updated id_number", name: "some updated name", site_id: 43, telephone_number: "some updated telephone_number"}

      assert {:ok, %Customer{} = customer} = Data.update_customer(customer, update_attrs)
      assert customer.country_id == 43
      assert customer.date_of_birth == ~D[2023-06-16]
      assert customer.id_number == "some updated id_number"
      assert customer.name == "some updated name"
      assert customer.site_id == 43
      assert customer.telephone_number == "some updated telephone_number"
    end

    test "update_customer/2 with invalid data returns error changeset" do
      customer = customer_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_customer(customer, @invalid_attrs)
      assert customer == Data.get_customer!(customer.id)
    end

    test "delete_customer/1 deletes the customer" do
      customer = customer_fixture()
      assert {:ok, %Customer{}} = Data.delete_customer(customer)
      assert_raise Ecto.NoResultsError, fn -> Data.get_customer!(customer.id) end
    end

    test "change_customer/1 returns a customer changeset" do
      customer = customer_fixture()
      assert %Ecto.Changeset{} = Data.change_customer(customer)
    end
  end
end
