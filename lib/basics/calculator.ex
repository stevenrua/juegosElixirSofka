defmodule Basics.Calculator do

  def sumar(a,b) do
    a+b
  end

  def restar(a,b) do
    a-b
  end

  # def multiplicar(a,b) when restar(a,b) > 0 do
  #   restar(a,b)
  # end

  #def sumaRecursive([])

  def division(a,b) when b !== 0 do
    a/b
  end

  def division(_,b) when b === 0 do
    :infinito
  end
end
