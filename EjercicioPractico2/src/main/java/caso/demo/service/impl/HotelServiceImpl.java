/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package caso.demo.service.impl;

import caso.demo.domain.Hotel;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import caso.demo.dao.HotelDao;
import caso.demo.service.HotelService;
@Service
public class HotelServiceImpl implements HotelService {
    @Autowired
    private HotelDao hotelDao;
    
    
    @Transactional(readOnly=true)
    @Override
    public List<Hotel> getHoteles() {
        var lista=hotelDao.findAll();
        return lista;
    }

     @Override
    @Transactional(readOnly = true)
    public Hotel getHotel(Hotel hotel) {
        return hotelDao.findById(hotel.getId()).orElse(null);
    }

    @Override
    @Transactional
    public void save(Hotel hotel) {
        hotelDao.save(hotel);
    }

    @Override
    @Transactional
    public void delete(Hotel hotel) {
        hotelDao.delete(hotel);
    }
}
