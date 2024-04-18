package caso.demo.service.impl;

import caso.demo.domain.Reserva;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import caso.demo.dao.ReservaDao;
import caso.demo.service.ReservaService;

@Service
public class ReservaServiceImpl implements ReservaService {

     @Autowired
    private ReservaDao reservaDao;

    @Override
    @Transactional(readOnly = true)
    public List<Reserva> getReservas() {
        var lista = reservaDao.findAll();
        return lista;
    }

    @Override
    @Transactional(readOnly = true)
    public Reserva getReserva(Reserva reserva) {
        return reservaDao.findById(reserva.getId()).orElse(null);
    }

    @Override
    @Transactional
    public void save(Reserva reserva) {
        reservaDao.save(reserva);
    }

    @Override
    @Transactional
    public void delete(Reserva reserva) {
        reservaDao.delete(reserva);
    }
    
 
}
