require 'colorize'


class Vista



  def index(list)
    puts "*" * 70
    puts "Los elementos de tu lista son: "
    for index_list in 0..list.count-1
      puts "#{index_list+1}.  #{list[index_list].task}"
    end
    puts "*" * 70
  end
  

  def add(new_task, list)
    puts "*" * 70
    puts "Agregaste la tarea: " + "\"#{new_task}\"".red + " a tu lista."
    puts ""
    puts "Los elementos de tu lista son: "
    puts ""
    for index_list in 0..list.count-1
      puts "#{index_list+1}.  #{list[index_list].task}"
    end
    puts "*" * 70
  end

  def delete(delete_num, list, delete_value)

    puts "*" * 70
    puts "Eliminaste la tarea: " + "\"#{delete_value}\"".red + " a tu lista."
    puts ""
    puts "Los elementos de tu lista son: "
    puts ""
    for index_list in 0..list.count-1
      puts "#{index_list+1}.  #{list[index_list].task}"
    end
    puts "*" * 70
  end


  def complete(array_completado, list, completed_value)
    puts "*" * 70
    puts "Completaste la tarea: " + "\"#{completed_value}\"".red + " a tu lista."
    puts ""
    puts "Los elementos de tu lista son: "
    puts ""
    for index_list in 0..list.count-1
      puts "#{index_list+1}. #{[array_completado[index_list]]} #{list[index_list].task}"
    end
    puts "*" * 70

  end


  def error
    system "clear"
    puts "Las opciones que elegiste no son validas"
    sleep(2)
    system "clear"
  end


end




