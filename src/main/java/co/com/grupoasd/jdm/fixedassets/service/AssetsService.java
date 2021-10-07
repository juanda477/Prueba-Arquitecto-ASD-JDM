/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/springframework/Service.java to edit this template
 */
package co.com.grupoasd.jdm.fixedassets.service;

import co.com.grupoasd.jdm.fixedassets.entity.Asset;
import co.com.grupoasd.jdm.fixedassets.message.AssetResponse;
import co.com.grupoasd.jdm.fixedassets.message.AssetUpdate;
import co.com.grupoasd.jdm.fixedassets.repository.AssetRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.TimeUnit;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author juand
 */
@Service
@RequiredArgsConstructor
public class AssetsService {

    private final AssetRepository assetRepository;
    private final ModelMapper modelMapper;

    @Transactional
    public List<AssetResponse> list() {
        List<AssetResponse> response = mapResults(assetRepository.findAll());
        return response;
    }

    @Transactional
    public List<AssetResponse> list(String query) {
        List<AssetResponse> response = mapResults(assetRepository.findByQuery(query));
        return response;
    }

    private List<AssetResponse> mapResults(List<Asset> results) {
        List<AssetResponse> response = new ArrayList<>();
        results.parallelStream()
                .map(asset -> modelMapper.map(asset, AssetResponse.class))
                .forEachOrdered(assetResponse -> {
                    response.add(assetResponse);
                });
        return response;
    }

    @Transactional
    public AssetResponse getById(Integer id) {
        Optional<Asset> asset = assetRepository.findById(id);
        return asset.isPresent() ? modelMapper.map(asset.get(), AssetResponse.class) : null;
    }

    @Transactional
    public AssetResponse update(Integer id, AssetUpdate assetUpdate) {
        Optional<Asset> asset = assetRepository.findById(id);
        if (asset.isEmpty()) {
            return null;
        }
        if (assetUpdate.getInventoryInternalNumber() != null) {
            asset.get().setInventoryInternalNumber(assetUpdate.getInventoryInternalNumber());
        }
        if (assetUpdate.getLeavingDate() != null) {
            long diffInMillies = assetUpdate.getLeavingDate().getTime() - asset.get().getPurchaseDate().getTime();
            long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
            if (diff < 0) {
                throw new IllegalArgumentException("La fecha de baja no puede ser inferior a la de compra!");
            }
            asset.get().setLeavingDate(assetUpdate.getLeavingDate());
        }
        assetRepository.save(asset.get());
        return modelMapper.map(asset.get(), AssetResponse.class);
    }
}
