package com.example.demo.Controller;



import com.example.demo.model.Pedido;
import com.example.demo.service.PedidoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/pedidos")
@CrossOrigin("*")
public class PedidoController {

    @Autowired
    private PedidoService service;

    @PostMapping
    public Pedido guardar(@RequestBody Pedido pedido) {
        return service.guardarPedido(pedido);
    }
}