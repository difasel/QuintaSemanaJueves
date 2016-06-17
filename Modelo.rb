require 'csv'


class List

  attr_accessor :arreglo_list, :valor_delete, :arreglo_complete, :valor_completado
  
  def initialize
    @file_name = "lista_pendientes.csv"
    @arreglo_list = []
    read_csv
  end


  def read_csv
    CSV.foreach(@file_name) do |row|
      @arreglo_list <<  Task.new(row[0], to_b(row[1]))  
    end
  end

  def to_b(string)

    string == "true" ? true : false

  end



  def add(nueva_linea)
    File.open(@file_name, 'a+') do |new_line|
      new_line.write("\n"+nueva_linea +"," + false.to_s)
    end
    @arreglo_list << Task.new(nueva_linea)
  end


  def delete(nueva_linea)


    @valor_delete = @arreglo_list[nueva_linea-1].task
    @arreglo_list.delete_at(nueva_linea-1)
    write


  end


  def write

    CSV.open(@file_name, 'wb') do |csv|
      @arreglo_list.each do |linea_list| 
        csv << [linea_list.task,linea_list.complete]
      end
    end
  end


  def complete(num_complete)


    @valor_completado = @arreglo_list[num_complete-1].task
    @arreglo_list[num_complete-1].complete = true
    write
    @arreglo_complete  = Array.new(@arreglo_list.count, " ")
    
    for val_x in 0..@arreglo_list.count-1

      if @arreglo_list[val_x].complete == true
        @arreglo_complete[val_x] = "X"
      end

    end

  end

end




class Task

  attr_accessor :task, :complete

  def initialize(task, complete = false)
    @task = task
    @complete = complete
  end

end
 
lista = List.new




