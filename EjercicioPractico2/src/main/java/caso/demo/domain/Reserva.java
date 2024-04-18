package caso.demo.domain;

import jakarta.persistence.*;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

@Data
@Entity
@Table(name = "reservas")

public class Reserva implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(name = "cliente_nombre")
    private String cliente_nombre;
    @Column(name = "num_huespedes")
    private int num_huespedes;
    @Column(name = "fecha_ingreso")
    private String fecha_ingreso;
    @Column(name = "fecha_salida")
    private String fecha_salida;
    @Column(name = "hotel_id")
    private int hotel_id;
    @Column(name = "user")
    private int user;

    public Reserva() {
    }

    public Reserva(Long id, String cliente_nombre, int num_huespedes, String fecha_ingreso, String fecha_salida, int hotel_id, int user) {
        this.id = id;
        this.cliente_nombre = cliente_nombre;
        this.num_huespedes = num_huespedes;
        this.fecha_ingreso = fecha_ingreso;
        this.fecha_salida = fecha_salida;
        this.hotel_id = hotel_id;
        this.user = user;
    }

}
