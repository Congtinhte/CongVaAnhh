package com.example.demo.ser.impl.giamgia;

import com.example.demo.entity.giamgia.GiamGiaSanPhamChiTiet;
import com.example.demo.repo.giamgia.GiamGiaSanPhamChiTietRepo;
import com.example.demo.ser.giamgia.GiamGiaSanPhamChiTietSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class GiamGiaSanPhamChiTietSerImpl implements GiamGiaSanPhamChiTietSer {

    @Autowired
    GiamGiaSanPhamChiTietRepo giamGiaSanPhamChiTietRepo;

    @Override
    public List<GiamGiaSanPhamChiTiet> getAll() {
        return giamGiaSanPhamChiTietRepo.findAll();
    }

    @Override
    public void add(GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet) {
        giamGiaSanPhamChiTietRepo.save(giamGiaSanPhamChiTiet);
    }

    @Override
    public List<GiamGiaSanPhamChiTiet> findAllByTrangThai(Integer trangThai) {
        return giamGiaSanPhamChiTietRepo.findAllByTrangThai(trangThai);
    }

    @Override
    public GiamGiaSanPhamChiTiet findByIdAoAndTrangThai(UUID id) {
        return giamGiaSanPhamChiTietRepo.findByIdAoAndTrangThai(id);
    }
}
