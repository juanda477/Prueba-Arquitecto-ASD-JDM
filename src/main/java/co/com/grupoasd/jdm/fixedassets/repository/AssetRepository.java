/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/springframework/Repository.java to edit this template
 */
package co.com.grupoasd.jdm.fixedassets.repository;

import co.com.grupoasd.jdm.fixedassets.entity.Asset;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author juand
 */
public interface AssetRepository extends JpaRepository<Asset, Integer>, JpaSpecificationExecutor<Asset> {

    @Query("SELECT a FROM Asset a "
            + " JOIN a.typeId t "
            + " WHERE CONCAT(a.serialNumber,t.name) like CONCAT('%',:q,'%') "
            + "   AND t.active = true ")
    List<Asset> findByQuery(@Param("q") String q);
}
