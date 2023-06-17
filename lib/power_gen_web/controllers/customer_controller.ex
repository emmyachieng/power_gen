defmodule PowerGenWeb.CustomerController do
  use PowerGenWeb, :controller

  alias PowerGen.Data
  alias PowerGen.Data.Customer

  def index(conn, _params) do
    customers = Data.list_customers()
    render(conn, "index.html", customers: customers)
  end

  def new(conn, _params) do
    changeset = Data.change_customer(%Customer{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"customer" => customer_params}) do
    case Data.create_customer(customer_params) do
      {:ok, customer} ->
        conn
        |> put_flash(:info, "Customer created successfully.")
        |> redirect(to: Routes.customer_path(conn, :show, customer))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    customer = Data.get_customer!(id)
    render(conn, "show.html", customer: customer)
  end

  def edit(conn, %{"id" => id}) do
    customer = Data.get_customer!(id)
    changeset = Data.change_customer(customer)
    render(conn, "edit.html", customer: customer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "customer" => customer_params}) do
    customer = Data.get_customer!(id)

    case Data.update_customer(customer, customer_params) do
      {:ok, customer} ->
        conn
        |> put_flash(:info, "Customer updated successfully.")
        |> redirect(to: Routes.customer_path(conn, :show, customer))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", customer: customer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    customer = Data.get_customer!(id)
    {:ok, _customer} = Data.delete_customer(customer)

    conn
    |> put_flash(:info, "Customer deleted successfully.")
    |> redirect(to: Routes.customer_path(conn, :index))
  end

  def import(conn, %{"csv" => csv}) do
    data = csv_decoder(csv)
    import_customers(data)
    conn
      |> put_flash(:info, "Customers imported successfully.")
      |> redirect(to: Routes.customer_path(conn, :index))
  end

  defp csv_decoder(file) do
    "#{file.path}"
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> CSV.decode(headers: true)
    |> Enum.map(fn data -> data end)
  end

  defp import_customers(data) do
    customers = Enum.map(data, fn {:ok, customer} -> parse(customer) end)
    params = Data.convert_params(customers)
    {_, _} = Data.insert_customers(params)
  end

  defp parse(customer) do
    Data.parse_fields(customer)
  end

end
