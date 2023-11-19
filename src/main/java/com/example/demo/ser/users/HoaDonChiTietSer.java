package com.example.demo.ser.users;


import com.example.demo.entity.khachhang.HoaDonChiTiet;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public interface HoaDonChiTietSer {
    void add(HoaDonChiTiet hoaDonChiTiet);

    List<HoaDonChiTiet> findByHoaDon(UUID id);

    void update(UUID id, HoaDonChiTiet updateHDCT);

    Integer soLuongBanTheoNgay(LocalDate date);

    List<Integer> soLuongBanTheoThang(LocalDate date1, LocalDate date2);

    Integer soLuongBanThangHienTai(LocalDate date1, LocalDate date2);

    Integer soLuongBanTrongThang(LocalDate date);
}
