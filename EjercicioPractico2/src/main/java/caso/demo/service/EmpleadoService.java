/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package caso.demo.service;
import caso.demo.domain.Empleado;
import java.util.List;
/**
 *
 * @author alejh
 */



public interface EmpleadoService {
   
    public List<Empleado> getEmpleados();

 
    public Empleado getEmpleado(Empleado empleado);
    
 
    public void save(Empleado empleado);
    
  
    public void delete(Empleado empleado);
}
