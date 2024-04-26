module ApplicationHelper

  def flash_class(type)
    case type
      when 'notice' then 'is-success'   # Clase para mensajes de éxito
      when 'alert'  then 'is-danger'    # Clase para mensajes de alerta
      else 'is-info'                    # Clase por defecto para otros mensajes
    end
  end

end
  
