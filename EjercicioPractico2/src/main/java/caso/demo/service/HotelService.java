/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package caso.demo.service;

import caso.demo.domain.Hotel;
import java.util.List;

public interface HotelService {
   
    public List<Hotel> getHoteles();

 
    public Hotel getHotel(Hotel hotel);
    
 
    public void save(Hotel hotel);
    
  
    public void delete(Hotel hotel);
}
