defmodule Basics.JuegoBlackJack do
  def pintas() do
    [%{
      clasification: "corazon",
      cartas: cartas() |> Enum.random()
    },
    %{
      clasification: "diamante",
      cartas: cartas() |> Enum.random()
    },
    %{
      clasification: "pica",
      cartas: cartas() |> Enum.random()
    },
    %{
      clasification: "trebol",
      cartas: cartas() |> Enum.random()
    }
  ]
  end

  def cartas() do
    [{"A", 11},{"2", 2},
    {"3", 3},{"4", 4},
    {"5", 5},{"6", 6},
    {"7", 7},{"8", 8},
    {"9", 9},{"10", 10},
    {"J", 10},{"Q", 10},
    {"K", 10}
  ]
  end

  def escogerCarta() do
    pintas() |> Enum.random()
  end

  def continuarJuego(ronda, listaCartasJugador, listaCartasCPU, puntosJugador, puntosCPU) when (puntosJugador < 21 and puntosCPU < 21) do
    IO.puts(String.duplicate("-", 100))
    IO.puts("Ronda: #{ronda}")
    IO.puts(String.duplicate("-", 100))
    cartaJugador = List.last(listaCartasJugador)
    IO.inspect("cartaJugador: #{inspect(cartaJugador[:cartas] |> elem(1))} #{inspect(cartaJugador[:clasification])}")
    puntosJugador = puntajeTotal(listaCartasJugador)
    IO.puts("Puntaje JUGADOR: #{puntosJugador}\n")
    cartaCPU = List.last(listaCartasCPU)
    IO.inspect("cartaCPU: #{inspect(cartaCPU[:cartas] |> elem(1))} #{inspect(cartaCPU[:clasification])}")
    puntosCPU = puntajeTotal(listaCartasCPU)
    IO.puts("Puntaje CPU: #{puntosCPU}\n")

    continuarJuego1 = IO.gets("Desea tomar una nueva carta S/N : \n") |> String.downcase()
    if ((continuarJuego1 |> String.contains?("s"))) do
      continuarJuego(ronda + 1, listaCartasJugador ++ [escogerCarta()], listaCartasCPU ++ [escogerCarta()], puntosJugador, puntosCPU)
    else
      ganador(puntosJugador, puntosCPU)
    end
  end

  def continuarJuego(_, _, _, puntosJugador, puntosCPU) when (puntosJugador > 21 and puntosCPU > 21) do
    IO.puts("Ambos jugadores pierden excedieron los 21 puntos permitidos")
  end

  def continuarJuego(_, _, _,puntosJugador, puntosCPU) when (puntosJugador >= 21 or puntosCPU >= 21) do
    case  {puntosJugador, puntosCPU} do
          {puntosJugador, _} when (puntosJugador === 21) -> IO.puts("El jugador gana con #{puntosJugador} puntos")
          {_, puntosCPU} when (puntosCPU === 21) -> IO.puts("La CPU gana con #{puntosCPU} puntos")
          {puntosJugador, puntosCPU} when (puntosJugador < puntosCPU and (puntosJugador < 21)) -> IO.puts("El jugador gana con #{puntosJugador} puntos")
          {puntosJugador, puntosCPU} when (puntosJugador > puntosCPU and (puntosCPU < 21)) -> IO.puts("La CPU gana con #{puntosCPU} puntos")
          {puntosJugador, puntosCPU} when (puntosCPU === puntosJugador and puntosJugador === 21) -> IO.puts("Ambos jugadores ganan con #{puntosCPU} puntos")
    end
  end

  def puntajeTotal(jugador) do
    Enum.reduce(jugador, 0, fn clave, acumulador ->
      acumulador + elem(clave[:cartas], 1)
    end)
  end

  def ganador(puntosJugador, puntosCPU) when (puntosJugador > puntosCPU and (puntosJugador <= 21)) do
      IO.puts("gana jugador con #{puntosJugador} puntos")
  end

  def ganador(puntosJugador, puntosCPU) when (puntosCPU > puntosJugador and (puntosCPU <= 21)) do
    IO.puts("gana CPU con #{puntosCPU} puntos")
  end

  def ganador(puntosJugador, puntosCPU) when (puntosJugador < puntosCPU and (puntosCPU > 21)) do
    IO.puts("gana jugador con #{puntosJugador} puntos")
  end

  def ganador(puntosJugador, puntosCPU) when (puntosCPU < puntosJugador and (puntosJugador > 21)) do
    IO.puts("gana CPU con #{puntosCPU} puntos")
  end

  def ganador(puntosJugador, puntosCPU) when (puntosJugador === puntosCPU and (puntosCPU < 21)) do
    IO.puts("Jugadores emptados con #{puntosJugador} puntos")
  end

  def ganador(puntosJugador, puntosCPU) when (puntosCPU === puntosJugador and (puntosJugador > 21)) do
    IO.puts("Ambos jugadores pierden con #{puntosCPU} puntos")
  end

  def iniciarJuego() do
    listaCartasJugador = [escogerCarta()]
    puntosJugador = puntajeTotal(listaCartasJugador)
    listaCartasCPU = [escogerCarta()]
    puntosCPU = puntajeTotal(listaCartasCPU)
    continuarJuego(1, listaCartasJugador, listaCartasCPU, puntosJugador, puntosCPU)
  end
end
