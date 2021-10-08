/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.com.grupoasd.jdm.fixedassets.specification;

import co.com.grupoasd.jdm.fixedassets.entity.Asset;
import java.util.Date;
import java.util.Optional;
import org.springframework.data.jpa.domain.Specification;

/**
 *
 * @author juand
 */
public class CommentSpecs {

    public static Specification<Asset> assetTypeNameEquals(Optional<String> assetTypeName) {
        return (root, query, builder)
                -> assetTypeName.isEmpty()
                        ? builder.conjunction()
                        : builder.equal(root.get("typeId").get("name"), assetTypeName);
    }

    public static Specification<Asset> purchaseDateEquals(Optional<Date> purchaseDate) {
        return (root, query, builder)
                -> purchaseDate.isEmpty()
                        ? builder.conjunction()
                        : builder.equal(root.get("purchaseDate"), purchaseDate);
    }

    public static Specification<Asset> serialEquals(Optional<String> serial) {
        return (root, query, builder)
                -> serial.isEmpty()
                        ? builder.conjunction()
                        : builder.equal(root.get("serial"), serial);
    }
}
