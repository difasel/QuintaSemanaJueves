require_relative 'Modelo'
require_relative 'Vista'

class Controlador

  def initialize(accion, valor)

    @accion = accion
    @valor = valor
    @lista = List.new
    @vista = Vista.new

  end

  def index 
    @vista.index(@lista.arreglo_list)
  end

  def add
    @lista.add(@valor)
    @vista.add(@valor, @lista.arreglo_list)
  end

  def delete
    @lista.delete(@valor.to_i)
    @vista.delete(@valor, @lista.arreglo_list, @lista.valor_delete)
  end

  def complete
    @lista.complete(@valor.to_i)
    @vista.complete(@lista.arreglo_complete, @lista.arreglo_list, @lista.valor_completado)
  end


  def error
    @vista.error
  end

end

accion_valor = ARGV
accion = accion_valor[0]  
valor  = accion_valor[1]

todo = Controlador.new(accion, valor)

if accion == "index"
  todo.index
elsif accion == "add"
  todo.add
elsif accion == "delete"
  todo.delete
elsif accion == "complete"
  todo.complete
else
  todo.error
end

 