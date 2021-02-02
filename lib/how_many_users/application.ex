defmodule HowManyUsers.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      HowManyUsersWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: HowManyUsers.PubSub},
      # Start the Endpoint (http/https)
      HowManyUsersWeb.Endpoint,
      # Start a worker by calling: HowManyUsers.Worker.start_link(arg)
      # {HowManyUsers.Worker, arg}
      HowManyUsersWeb.Presence
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HowManyUsers.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    HowManyUsersWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
