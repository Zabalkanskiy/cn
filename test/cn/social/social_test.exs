defmodule Cn.SocialTest do
  use Cn.DataCase
  alias Cn.Social

setup do
  {:ok, user} = Cn.Social.create_login(%{
    nickname: "test",
  name: "test",
    email: "test@test.com",
    password: "test",
    password_confirmation: "test"
  })
  {:ok, user: user}
end
  describe "people" do

      @valid_attrs %{name: "Alex", surname: "Zab", sex: true, country: "Russia", about: "My name is Alex", city: "Moscow" }
      def people_fixture(attrs\\%{})do
          with create_attrs <- Enum.into(attrs, @valid_attrs),
              {:ok, people} <- Social.create_people(create_attrs) do
                  people
              end
      end
  end

  test "all_people/0 return 1 people", %{user: user} do
  people = people_fixture(%{user_id: user.id})
  assert Social.all_people() = [people]
end

  test "new_people/0 return new blank changeset" do
  changeset = Social.new_people()
  assert changeset.__struct__ = Ecto.changeset
end

  test "create_people/1 return a new people",  %{user: user} do
  {:ok, people} = Social.create_people(Map.put(@valid_atrs, (%{user_id: user.id})))
  assert Enum.any?(Social.all_people(),fn p -> p.id = people.id end)
end

  describe("Login") do
  #Добавте hashpassord если он есть в cast в проверке схемы
  @valid_user %{nickname: "test", name: "test", email: "test@test.com", password: "test", password_confirmation: "test" }

  def login_fixture(attrs \\%{}) do
    with create_attrs <- Map.merge( @valid_user, attrs)
      {:ok, login} <- Social.create_login(create_attrs) do
      login
      |>Map.merge(%{password: nil, password_confirmation: nil})
      else
      error -> error
     end
  end
end


test "list_login/0 return all users" do
  user = login_fixture
  assert Social.list_login() == [user]
end
test "get_user/1 returns the user with the id" do
  user = login_fixture()
  assert Social.get_user(user.id) == user

end

test "new_login/0 returns a blank changeset" do
  changeset = Social.new_login()
  assert changeset.__struct__ == Ecto.Changeset
end

test "create_login/1 creates the user in the db and returns it" do
  before = Socila.list_login()
  user = login_fixture()
  updated = Social.list_login()
  assert !(Enum.any?(before, fn u -> user == u end))
  assert Enum.any?(updated, fn u -> user ==u end)
end

test "create_login/1 fails to create the user without a password and password_confirmation" do
    {:error, changeset} = login_fixture(%{password: nil, password_confirmation: nil})
    assert !changeset.valid?
  end

test "create_user/1 fails to create the user when the password and the password_confirmation don't match" do
    {:error, changeset} = login_fixture(%{password: "test", password_confirmation: "fail"})
    assert !changeset.valid?
  end
test "get_user_by_username/1 returns the user with the matching username" do
    user = login_fixture()
    assert Social.get_user_by_username(user.username)
  end

test "get_user_by_username/1 returns nil with no matching username" do
    assert is_nil(Social.get_user_by_username("fail"))
  end

test "create_login/1 fails to create the user when the username already exists" do
  _user1 = login_fixture()
  {:error, user2} = login_fixture()
  assert !user2.valid?
end

test "create_login/1 fails to create the user when the email is not an email format" do
  {:error, user} = login_fixture(%{email: "testtestcom"})
  assert !user.valid?
end

test "create_login/1 fails to create the user when the username is too short" do
  {:error, user} = login_fixture(%{username: "a"})
  assert !user.valid?
end
end
