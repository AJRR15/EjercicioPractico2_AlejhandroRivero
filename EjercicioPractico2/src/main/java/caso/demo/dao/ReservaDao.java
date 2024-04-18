package caso.demo.dao;

import java.util.List;
import caso.demo.domain.Reserva;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ReservaDao extends JpaRepository <Reserva, Long> {
    
}
