package caso.demo.service;

import caso.demo.domain.Reserva;
import java.util.List;

public interface ReservaService {

    public List<Reserva> getReservas();

    // Se obtiene un Reserva, a partir del id de un reserva
    public Reserva getReserva(Reserva reserva);
    
    // Se inserta un nuevo reserva si el id del reserva esta vacío
    // Se actualiza un reserva si el id del reserva NO esta vacío
    public void save(Reserva reserva);
    
    // Se elimina el reserva que tiene el id pasado por parámetro
    public void delete(Reserva reserva);
    
}
