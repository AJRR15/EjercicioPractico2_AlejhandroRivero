package caso.demo.controller;


import caso.demo.domain.Reserva;
import caso.demo.domain.Hotel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import caso.demo.service.ReservaService;
import caso.demo.service.HotelService;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;


@Controller
@RequestMapping("/reserva")
public class ReservaController {
  
    @Autowired
    private ReservaService reservaService;
    @Autowired
    private HotelService hotelService;
    
    
    @GetMapping("/listado")
    public String listado(Model model) {
        var reservas = reservaService.getReservas();
        model.addAttribute("reservas", reservas); 
        return "reserva/listado"; 
    }    
     @GetMapping("/reserva")
    public String reservaNuevo(Reserva reserva) {
        return "/reserva/reserva";
    }

    @PostMapping("/guardar")
    public String reservaGuardar(Reserva reserva) { 
        reservaService.save(reserva);
        return "redirect:/mensaje";
    }

    @GetMapping("/eliminar/{id}")
    public String reservaEliminar(Reserva reserva) {
        reservaService.delete(reserva);
        return "redirect:/reserva/listado";
    }

    @GetMapping("/modificar/{id}")
    public String reservaModificar(Reserva reserva, Model model) {
        reserva = reservaService.getReserva(reserva);
        model.addAttribute("reserva", reserva);
        return "/reserva/modifica";
    }   
}