defmodule Cn.Social do
  import Ecto.Query, warn: false
  alias Cn.Repo
  alias Cn.Social.Friend
  alias Cn.Social.Community
  alias Cn.Social.Login
  alias Cn.Social.Message
  alias Cn.Social.People
  alias Cn.Social

  def list_of_frieds()do
    #Здесь будет представлен список друзей
  end
  def new_people() do
		People.changeset(%People{},{})
	end

  def new_login() do
		Login.changeset(%Login{},{})
	end

  #параметры для загрузки формы в бд
	def create_people_in_base(people_params) do
		Repo.transaction(fn ->
		with {:ok, people}<-create_people(people_params) do
				people
			else
				_ -> Repo.rollback("Failed to create poll")
		  end
	     	end)
	end

  def create_login_in_base(user_param) do
		Repo.transaction(fn ->
			with {:ok, user}<- create_login(user_param) do
				user
			else
				_ -> Repo.rollback("Failed to create user")
		end
		end)
	end

  def create_people(attrs) do
		%People{}
		|>People.changeset(attrs)
		|>Repo.insert()
	end


	def create_login(attrs) do
		%Login{}
		|>Login.changeset(attrs)
		|>Repo.insert()
	end

  def all_people do
		Repo.all(People)
	end
	def list_login do
		Repo.all(Login)
	end

	def get_user(id) do
		Repo.get(Login, id)
	end

	def get_user_by_username(username) do
    Repo.get_by(Login, username: username)
  end
end


