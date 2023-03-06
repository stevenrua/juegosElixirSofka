defmodule Basics.ConcursoMago do

  def puertas() do
    [%{
      puerta: "|P1|",
      premio: asignarPremioPuerta()
     },
    %{
      puerta: "|P2|",
      premio: asignarPremioPuerta()
    },
    %{
      puerta: "|P3|",
      premio: asignarPremioPuerta()
    },
    %{
      puerta: "|P4|",
      premio: asignarPremioPuerta()
    },
    # %{
    #   puerta: "|P5|",
    #   premio: asignarPremioPuerta()
    # },
    # %{
    #   puerta: "|P6|",
    #   premio: asignarPremioPuerta()
    # },
    # %{
    #   puerta: "|P7|",
    #   premio: asignarPremioPuerta()
    # },
    # %{
    #   puerta: "|P8|",
    #   premio: asignarPremioPuerta()
    # },
    # %{
    #   puerta: "|P9|",
    #   premio: asignarPremioPuerta()
    # },
    # %{
    #   puerta: "|P10|",
    #   premio: asignarPremioPuerta()
    # }
  ]
  end

  def premios() do
    ["X", "X", "X", "0", "0", "0", "0", "$50", "$100", "$200"] |> Enum.shuffle()
  end

  def asignarPremioPuerta() do
    premios() |> Enum.random()
  end



  def continuarJuego(ronda, listaPuertas) do
    IO.puts(String.duplicate("-", 100))
    IO.puts("Ronda #: #{ronda}")
    IO.puts(String.duplicate("-", 100))
    IO.puts("Puertas disponibles")
    IO.puts(listaPuertas)
    IO.puts("Seleccione una puerta")
  end

  def iniciar() do
    listaPuertasConPremios = puertas()
    listaPuertas = listaPuertasConPremios |> Enum.map(fn puertas -> puertas.puerta end)
    IO.inspect(listaPuertasConPremios)
    continuarJuego(1, listaPuertas)
    #listaPremios = listaPuertasConPremios |> Enum.map(fn premios -> premios.premio end)

  end
end
