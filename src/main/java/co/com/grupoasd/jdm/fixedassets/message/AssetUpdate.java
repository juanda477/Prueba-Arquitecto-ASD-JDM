/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.com.grupoasd.jdm.fixedassets.message;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import lombok.Data;

/**
 *
 * @author juand
 */
@Data
public class AssetUpdate {

    private Integer assetId;
    private Long inventoryInternalNumber;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date leavingDate;
}
