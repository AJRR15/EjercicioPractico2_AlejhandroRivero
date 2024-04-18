/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package caso.demo.dao;
import caso.demo.domain.Empleado;
import org.springframework.data.jpa.repository.JpaRepository;
/**
 *
 * @author alejh
 */


public interface EmpleadoDao extends JpaRepository <Empleado,Long>{
    
}
