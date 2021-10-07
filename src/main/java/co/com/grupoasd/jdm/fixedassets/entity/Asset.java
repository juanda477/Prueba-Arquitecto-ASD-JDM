/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.com.grupoasd.jdm.fixedassets.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author juand
 */
@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Asset implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "asset_id", nullable = false)
    private Integer assetId;
    @Basic(optional = false)
    @Column(nullable = false)
    private String name;
    @Column
    private String description;
    @Basic(optional = false)
    @Column(name = "serial_number", nullable = false)
    private String serialNumber;
    @Basic(optional = false)
    @Column(name = "inventory_internal_number", nullable = false)
    private long inventoryInternalNumber;
    private BigInteger weight;
    private Integer length;
    private Integer width;
    private Integer height;
    @Column(name = "purchase_value", precision = 18, scale = 2)
    private BigDecimal purchaseValue;
    @Column(name = "purchase_date")
    @Temporal(TemporalType.DATE)
    private Date purchaseDate;
    @Column(name = "leaving_date")
    @Temporal(TemporalType.DATE)
    private Date leavingDate;
    @JoinColumn(name = "status_id", referencedColumnName = "status_id", nullable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private AssetStatus statusId;
    @Column
    private String color;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "asset", fetch = FetchType.LAZY)
    private Allocation allocation;
    @JoinColumn(name = "type_id", referencedColumnName = "type_id", nullable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private AssetType typeId;

}
