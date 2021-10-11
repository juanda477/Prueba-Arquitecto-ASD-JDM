/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/springframework/RestController.java to edit this template
 */
package co.com.grupoasd.jdm.fixedassets.api;

import co.com.grupoasd.jdm.fixedassets.message.AssetInsert;
import co.com.grupoasd.jdm.fixedassets.message.AssetResponse;
import co.com.grupoasd.jdm.fixedassets.message.AssetUpdate;
import co.com.grupoasd.jdm.fixedassets.service.AssetsService;
import java.text.ParseException;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

/**
 *
 * @author juand
 */
@RestController
@RequestMapping("${api.path}/assets")
@RequiredArgsConstructor
public class AssetsRestController {

    private final AssetsService assetsService;

    @GetMapping()
    public ResponseEntity<List<AssetResponse>> list() {
        return ResponseEntity.ok(assetsService.list());
    }

    @GetMapping("/find")
    public ResponseEntity<List<AssetResponse>> findByQuery(@RequestParam("q") String query) {
        return ResponseEntity.ok(assetsService.list(query));
    }

    @GetMapping("/{id}")
    public ResponseEntity<AssetResponse> get(@PathVariable Integer id) {
        AssetResponse response = assetsService.getById(id);
        if (response != null) {
            return ResponseEntity.ok(response);
        } else {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/search")
    public ResponseEntity<List<AssetResponse>> search(
            @RequestParam("tipo") Optional<String> tipo,
            @RequestParam("fechaCompra") Optional<String> fechaCompra,
            @RequestParam("serial") Optional<String> serial) {
        List<AssetResponse> response;
        try {
            response = assetsService.search(tipo, fechaCompra, serial);
        } catch (ParseException ex) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Fecha de compra sin el formato yyyyMMdd");
        }
        if (response != null) {
            return ResponseEntity.ok(response);
        } else {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<AssetResponse> put(@PathVariable Integer id, @RequestBody AssetUpdate input) {
        AssetResponse response = assetsService.getById(id);
        if (response != null) {
            try {
                return ResponseEntity.ok(assetsService.update(id, input));
            } catch (IllegalArgumentException ex) {
                throw new ResponseStatusException(HttpStatus.EXPECTATION_FAILED, ex.getLocalizedMessage());
            }
        } else {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
    }

    @PutMapping("/")
    public ResponseEntity<AssetResponse> insert(@RequestBody AssetInsert input) {
        if (input == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Método de insertar sin información!");
        }
        try {
            return ResponseEntity.ok(assetsService.insert(input));
        } catch (IllegalArgumentException ex) {
            throw new ResponseStatusException(HttpStatus.EXPECTATION_FAILED, ex.getLocalizedMessage());
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable String id) {
        return null;
    }

}
