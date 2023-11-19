package com.example.demo.ser.impl.sanpham;

import com.example.demo.entity.sanpham.AoChiTiet;
import com.example.demo.entity.sanpham.MauSac;
import com.example.demo.entity.sanpham.Size;
import com.example.demo.repo.sanpham.AoChiTietRepo;
import com.example.demo.repo.sanpham.MauSacRepo;
import com.example.demo.ser.sanpham.AoChiTietSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class AoChiTietSerImpl implements AoChiTietSer {

    @Autowired
    AoChiTietRepo aoChiTietRepo;

    @Autowired
    MauSacRepo mauSacRepo;

    @Override
    public List<AoChiTiet> findByAoId(UUID id) {
        return aoChiTietRepo.findByAoId(id);
    }

    @Override
    public void add(AoChiTiet aoChiTiet) {
        aoChiTietRepo.save(aoChiTiet);
    }

    @Override
    public void update(UUID id, AoChiTiet updateACT) {
        AoChiTiet aoChiTiet = aoChiTietRepo.findById(id).orElse(null);
        aoChiTiet.setAo(updateACT.getAo());
        aoChiTiet.setMau_sac(updateACT.getMau_sac());
        aoChiTiet.setSize(updateACT.getSize());
        aoChiTiet.setSlton(updateACT.getSlton());
        aoChiTiet.setSlban(updateACT.getSlban());
        aoChiTiet.setTrangthai(updateACT.getTrangthai());
        aoChiTietRepo.save(aoChiTiet);
    }

    @Override
    public AoChiTiet findById(UUID id) {
        return aoChiTietRepo.findById(id).orElse(null);
    }

    @Override
    public List<Size> findSizeByIdAo(UUID idAo) {
        return aoChiTietRepo.findSizeByIdAo(idAo);
    }

    @Override
    public List<MauSac> findMauSacByIdAo(UUID idAo) {
        return aoChiTietRepo.findMauSacByIdAo(idAo);
    }

    @Override
    public AoChiTiet findIdByIdAoMsSize(UUID id, UUID idMauSac, UUID idSize) {
        return aoChiTietRepo.findIdByIdAoMsSize(id, idMauSac, idSize);
    }

    @Override
    public int soLuongAoChiTietByIdAo(UUID id) {
        return aoChiTietRepo.soLuongAoChiTietByIdAo(id);
    }

}
