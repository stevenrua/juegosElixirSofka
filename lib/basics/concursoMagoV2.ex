defmodule Basics.ConcursoMagoV2 do
  alias Basics.MostrarPremio, as: Principal

  def puertasConPremios() do
    [
      ["X", "X", "X", "0", "0", "0", "0", 50, 100, 200] |> Enum.shuffle(),
      ["|P1|", "|P2|", "|P3|", "|P4|", "|P5|", "|P6|", "|P7|", "|P8|", "|P9|", "|P10|"],
      ["Closed", "Closed", "Closed", "Closed", "Closed", "Closed", "Closed", "Closed", "Closed", "Closed"]
    ]
  end

  def calcularGanancias(dineroAcumulado, llantasAcumuladas, premiosSel, erradas, opcionSeleccionada, totalAbiertas) do
    dineroAcumulado = if(is_integer(premiosSel) and (Enum.at(totalAbiertas, opcionSeleccionada - 1) === "Closed")) do dineroAcumulado + premiosSel else dineroAcumulado end
    llantasAcumuladas = if(is_bitstring(premiosSel) and String.contains?(premiosSel, "0") and (Enum.at(totalAbiertas, opcionSeleccionada - 1) === "Closed")) do llantasAcumuladas + 1 else llantasAcumuladas end
    erradas = if(is_bitstring(premiosSel) and String.contains?(premiosSel, "X")) do erradas + 1 else erradas end
    [dineroAcumulado, llantasAcumuladas, erradas]
  end

  def iniciarJuego() do
    puertasPremios = puertasConPremios()
    premios = Enum.at(puertasPremios, 0)
    puertas = Enum.at(puertasPremios, 1)
    totalAbiertas = Enum.at(puertasPremios, 2)
    IO.inspect(premios)
    IO.puts("")
    ronda = 1
    dineroAcumulado = 0
    llantasAcumuladas = 0
    erradas = 0
    Principal.mostrarPremio(ronda, dineroAcumulado, llantasAcumuladas, premios, puertas, totalAbiertas,0, erradas)
  end
end
