defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      (level === 0 and not legacy?) -> :trace
      (level === 1) -> :debug
      (level === 2) -> :info
      (level === 3) -> :warning
      (level === 4) -> :error
      (level === 5 and not legacy?) -> :fatal
      :unknown -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    cond do
      (level === 0 or level === 5 or level === 6) and legacy? -> :dev1
      (level === 4) or (level === 5 and not legacy?) -> :ops
      (level === 6 and not legacy?) -> :dev2
      :unknown -> false
    end
  end
end