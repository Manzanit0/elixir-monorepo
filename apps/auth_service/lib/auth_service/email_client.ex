defmodule AuthService.EmailClient do
  def send_email(attrs) do
    {id, attrs} =
      Map.pop_lazy(attrs, :id, fn -> System.unique_integer([:monotonic, :positive]) end)

    Tesla.put(client(), "/api/emails/#{id}", attrs)
  end

  defp client do
    config = Application.get_env(:auth_service, AuthService.EmailClient)

    middleware = [
      {Tesla.Middleware.BaseUrl, config[:base_url]},
      Tesla.Middleware.Telemetry,
      TeslaMiddlewareOpentelemetry,
      {Tesla.Middleware.Headers, [{"content-type", "application/json"}]},
      Tesla.Middleware.JSON,
      {Tesla.Middleware.Timeout, timeout: 2_000},
      Tesla.Middleware.Logger
    ]

    Tesla.client(middleware)
  end
end
