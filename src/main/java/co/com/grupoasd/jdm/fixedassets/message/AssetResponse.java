/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.com.grupoasd.jdm.fixedassets.message;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author juand
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AssetResponse {

    private Integer assetId;
    private String name;
    private String description;
    private String serialNumber;
    private long inventoryInternalNumber;
    private BigInteger weight;
    private Integer length;
    private Integer width;
    private Integer height;
    private BigDecimal purchaseValue;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date purchaseDate;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date leavingDate;
    private String statusName;
    private String color;
    private Character allocatedType;
    private String allocationAreaByCityAreaName;
    private String allocationAreaByCityCityName;
    private String allocationPersonFullName;
    private String assetTypeName;
}
