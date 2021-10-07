/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.com.grupoasd.jdm.fixedassets.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
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
@Table(name = "area_by_city", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"area_id", "city_id"})})
public class AreaByCity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "area_by_city_id", nullable = false)
    private Integer areaByCityId;
    @Basic(optional = false)
    @Column(nullable = false)
    private boolean active;
    @OneToMany(mappedBy = "areaByCityId", fetch = FetchType.LAZY)
    private List<Allocation> allocationList;
    @JoinColumn(name = "area_id", referencedColumnName = "area_id", nullable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Area areaId;
    @JoinColumn(name = "city_id", referencedColumnName = "city_id", nullable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private City cityId;

}
