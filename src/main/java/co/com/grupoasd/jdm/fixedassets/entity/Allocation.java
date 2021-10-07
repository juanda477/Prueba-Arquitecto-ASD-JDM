/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.com.grupoasd.jdm.fixedassets.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
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
public class Allocation implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "asset_id", nullable = false)
    private Integer assetId;
    @Basic(optional = false)
    @Column(name = "allocated_type", nullable = false)
    private Character allocatedType;
    @JoinColumn(name = "area_by_city_id", referencedColumnName = "area_by_city_id")
    @ManyToOne(fetch = FetchType.LAZY)
    private AreaByCity areaByCityId;
    @JoinColumn(name = "asset_id", referencedColumnName = "asset_id", nullable = false, insertable = false, updatable = false)
    @OneToOne(optional = false, fetch = FetchType.LAZY)
    private Asset asset;
    @JoinColumn(name = "person_id", referencedColumnName = "person_id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Person personId;
    
}
