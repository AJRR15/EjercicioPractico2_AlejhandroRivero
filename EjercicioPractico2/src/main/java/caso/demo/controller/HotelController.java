/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package caso.demo.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import caso.demo.domain.Hotel;
import caso.demo.service.HotelService;
@Controller
@Slf4j
@RequestMapping("/hotel")
public class HotelController {
    @Autowired
    private HotelService hotelService;

    @GetMapping("/listado")
    public String inicio(Model model) {
        var hoteles = hotelService.getHoteles();
        model.addAttribute("hoteles", hoteles);
        return "/hotel/listado";
    }
    
    
    @GetMapping("/nuevo")
    public String hotelNuevo(Hotel hotel) {
        return "/hotel/modifica";
    }

    
    @PostMapping("/guardar")
    public String hotelGuardar(Hotel hotel) {        
        hotelService.save(hotel);
        return "redirect:/hotel/listado";
    }

    @GetMapping("/eliminar/{id}")
    public String hotelEliminar(Hotel hotel) {
        hotelService.delete(hotel);
        return "redirect:/hotel/listado";
    }

    @GetMapping("/modificar/{id}")
    public String hotelModificar(Hotel hotel, Model model) {
        hotel = hotelService.getHotel(hotel);
        model.addAttribute("hotel", hotel);
        return "/hotel/modifica";
    }
}
