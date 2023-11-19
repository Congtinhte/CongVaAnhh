package com.example.demo.repo.users;

import com.example.demo.entity.khachhang.HoaDon;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Repository
public interface HoaDonRepo extends JpaRepository<HoaDon, UUID> {

    @Query("select sum(hdct.soLuong) from HoaDonChiTiet hdct where hdct.hoaDon.id = ?1")
    Long tongSl(UUID id);

    @Query("select hd from HoaDon hd where hd.khachHang.id = ?1 and hd.trangThai = ?2")
    Page<HoaDon> listHoaDonFindByKhAndTrangThai(UUID idKh, int trangThai, Pageable pageable);

    @Query("select hd from HoaDon hd where hd.trangThai = ?1")
    Page<HoaDon> listHoaDonFindByTrangThai( int trangThai, Pageable pageable);

    @Query("select hd from HoaDon hd where hd.khachHang.id = ?1 and hd.trangThai = ?2")
    List<HoaDon> findByUserAndTrangThai(UUID id, int trangThai);

    @Query("select hd from HoaDon hd where hd.ma = ?1")
    HoaDon findByMa(String ma);

    @Query("SELECT distinct cast(hd.ngayHoanThanh as date)  FROM HoaDon hd WHERE cast(hd.ngayHoanThanh as date) IS NOT NULL")
    List<Object[]> listNgayThanhToanHoanThanh();

    @Query("select count(hd.ma) from HoaDon hd where CAST(hd.ngayChoXacNhan AS DATE) = ?1 and hd.trangThai = ?2")
    int soLuongHoaDonTheoNgayandTrangThai(LocalDate date, int trangThai);

    @Query("select count(hd.ma) from HoaDon hd where CAST(hd.ngayHoanThanh AS DATE)  = ?1")
    Integer soLuongHoaDonHoanThanhTheoNgay(LocalDate date);

    @Query("SELECT COUNT(hd.ma) FROM HoaDon hd WHERE  CAST(hd.ngayXacNhan AS DATE) <= ?1 AND hd.trangThai = 2")
    int countHoaDonDangGiaoByNgayHienTai(LocalDate date);

    @Query("SELECT COUNT(hd.ma) FROM HoaDon hd WHERE  CAST(hd.ngayHuy AS DATE) = ?1 AND hd.trangThai = 4")
    int countHoaDonHuyByNgayHienTai(LocalDate date);

    @Query("select hd from HoaDon hd where cast(hd.ngayTao as date) = ?1 and (hd.trangThai = 1 OR hd.trangThai = 2 OR hd.trangThai = 3 OR hd.trangThai = 4)")
    Page<HoaDon> listHoaDonTheoNgay(LocalDate date, Pageable pageable);

    @Query(value = "select * from HoaDon where TrangThai = 1 or TrangThai = 2 or TrangThai = 3 or TrangThai = 4 order by NgayTao DESC",nativeQuery = true)
    List<HoaDon> findAllByOrderByNgayTaoDesc();

    @Query("select sum(hd.tongTien) from HoaDon hd where cast(hd.ngayThanhToan as date)  =?1 ")
    Double doanhThuTheoNgay(LocalDate date);

    @Query("SELECT COUNT(DISTINCT hd.khachHang) FROM HoaDon hd\n" +
            "WHERE cast(hd.ngayThanhToan as date)  = ?1\n")

    Integer soLuongKhachMuaTheoNgay(LocalDate date);

    @Query("SELECT  sum(hd.tongTien) " +
            "FROM HoaDon hd " +
            "WHERE cast(hd.ngayThanhToan as date) >= ?1 AND cast(hd.ngayThanhToan as date) <= ?2 " +
            "GROUP BY DATEPART(MONTH, cast(hd.ngayThanhToan as date) ), DATEPART(YEAR, cast(hd.ngayThanhToan as date)) " +
            "ORDER BY DATEPART(YEAR, cast(hd.ngayThanhToan as date)), DATEPART(MONTH, cast(hd.ngayThanhToan as date))")
    List<Double> doanhThuTheoThang(LocalDate date1, LocalDate date2);
    @Query("SELECT  sum(hd.tongTien) " +
            "FROM HoaDon hd " +
            "WHERE cast(hd.ngayThanhToan as date) >= ?1 AND cast(hd.ngayThanhToan as date) <= ?2 " +
            "GROUP BY DATEPART(MONTH, cast(hd.ngayThanhToan as date) ), DATEPART(YEAR, cast(hd.ngayThanhToan as date)) " +
            "ORDER BY DATEPART(YEAR, cast(hd.ngayThanhToan as date)), DATEPART(MONTH, cast(hd.ngayThanhToan as date))")
    Double doanhThuThangHienTai(LocalDate date1, LocalDate date2);
    @Query("SELECT DATEPART(MONTH, hd.ngayThanhToan)  " +
            "FROM HoaDon hd " +
            "WHERE cast(hd.ngayThanhToan as date) >= ?1 AND cast(hd.ngayThanhToan as date) <= ?2 " +
            "GROUP BY DATEPART(MONTH, hd.ngayThanhToan), DATEPART(YEAR, hd.ngayThanhToan) " +
            "ORDER BY DATEPART(YEAR, hd.ngayThanhToan), DATEPART(MONTH, hd.ngayThanhToan)")
    List<Integer> getDataThang(LocalDate date1, LocalDate date2);

    @Query("SELECT SUM(hd.tongTien) FROM HoaDon hd " +
            "WHERE MONTH(hd.ngayThanhToan) = MONTH(:date) " +
            "AND YEAR(hd.ngayThanhToan) = YEAR(:date)")
    Double doanhThuThang(@Param("date") LocalDate date1);

    @Query("SELECT COUNT(DISTINCT hd.khachHang.id) FROM HoaDon hd " +
            "WHERE MONTH(hd.ngayThanhToan) = MONTH(:currentDate) " +
            "AND YEAR(hd.ngayThanhToan) = YEAR(:currentDate)")
    Integer soLuongKhachMuaTrongThang(@Param("currentDate") LocalDate currentDate);

    @Query("SELECT COUNT(*) FROM HoaDon hd " +
            "WHERE MONTH(hd.ngayThanhToan) = MONTH(:currentDate) " +
            "AND YEAR(hd.ngayThanhToan) = YEAR(:currentDate)")
    Integer soHoaDonTrongThang(@Param("currentDate") LocalDate currentDate);



}
