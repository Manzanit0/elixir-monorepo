defmodule TeslaMiddlewareOpentelemetry do
  @behaviour Tesla.Middleware

  require OpenTelemetry.Tracer, as: Tracer

  @moduledoc """
  Tesla middleware for propagating OpenTelemetry spans with requests.
  """

  @impl Tesla.Middleware
  def call(env, next, _opts) do
    uri = %URI{path: path} = URI.parse(env.url)

    Tracer.with_span path, %{attributes: http_attributes(env, uri)} do
      env
      |> Tesla.put_headers(:otel_propagator_text_map.inject([]))
      |> Tesla.run(next)
    end
  end

  defp http_attributes(env, uri) do
    attributes = [
      "http.host": uri.host,
      "http.method": env.method,
      "http.path": uri.path,
      "http.url": env.url
    ]

    case Tesla.get_header(env, "user-agent") do
      nil ->
        attributes

      user_agent ->
        Keyword.put(attributes, :"http.user_agent", user_agent)
    end
  end
end
