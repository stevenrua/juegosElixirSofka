defmodule Basics.MostrarPremio do
  alias Basics.ConcursoMagoV2, as: ContinuarJuego
  def mostrarPremio(ronda, dineroAcumulado, llantasAcumuladas, premios, puertas, totalAbiertas, _, erradas) when ((ronda <= 6) and llantasAcumuladas < 4 and erradas < 3)  do
    IO.puts(String.duplicate("-", 100))
    IO.puts("Ronda: #{ronda}")
    IO.puts(String.duplicate("-", 100))
    IO.inspect(puertas)
    opcionSeleccionada = IO.gets("\nSeleccione una puerta: ")
    opcionSeleccionada = String.to_integer(String.trim(opcionSeleccionada))
    premiosSel = Enum.at(premios, opcionSeleccionada - 1)
    puertas = List.replace_at(puertas, opcionSeleccionada - 1, premiosSel)
    gananciasTotales = ContinuarJuego.calcularGanancias(dineroAcumulado, llantasAcumuladas, premiosSel, erradas, opcionSeleccionada, totalAbiertas)
    totalAbiertas = List.replace_at(totalAbiertas, opcionSeleccionada - 1, "Open")
    dineroAcumulado = Enum.at(gananciasTotales, 0)
    llantasAcumuladas = Enum.at(gananciasTotales, 1)
    erradas = Enum.at(gananciasTotales, 2)
    IO.puts("Dinero ganado: #{dineroAcumulado}")
    IO.puts("LLantas encontradas: #{llantasAcumuladas}")
    IO.puts("Total equivocaciones: #{erradas}")
    mostrarPremio(ronda + 1, dineroAcumulado, llantasAcumuladas, premios, puertas, totalAbiertas, opcionSeleccionada,erradas)
  end

  def mostrarPremio(ronda,dineroAcumulado,llantasAcumuladas,_,puertas,_,_,erradas) when ronda > 6  do
    IO.puts("----------------------------------------- PARTIDA PERDIDA -----------------------------------------")
    IO.puts("Lo siento perdiste, se han excedido las 6 rondas permitidas, tienes un saldo de $ #{dineroAcumulado} encontraste #{llantasAcumuladas} llantas y erraste #{erradas} veces")
    IO.puts("")
    IO.inspect(puertas)
    IO.puts("")
  end

  def mostrarPremio(_,dineroAcumulado,llantasAcumuladas,_,puertas,_,_,erradas) when (erradas === 3) do
    IO.puts("----------------------------------------- PARTIDA PERDIDA -----------------------------------------")
    IO.puts("Lo siento perdiste, ha errado 3 veces, tiene un saldo $ #{dineroAcumulado} y encontro #{llantasAcumuladas} llantas")
    IO.puts("")
    IO.inspect(puertas)
    IO.puts("")
  end

  def mostrarPremio(_,dineroAcumulado,llantasAcumuladas,_,puertas,_,_,erradas) when llantasAcumuladas === 4 do
    IO.puts("----------------------------------------- PARTIDA GANADA -----------------------------------------")
    IO.puts("felicidas has ganado el carro, tiene un saldo de $ #{dineroAcumulado} y erraste un total de #{erradas} veces")
    IO.puts("")
    IO.inspect(puertas)
    IO.puts("")
  end
end
