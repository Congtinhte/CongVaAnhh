package com.example.demo.controller.admin.sanpham;

import com.example.demo.entity.dto.BieuDoDoanhThuDTO;
import com.example.demo.entity.dto.BieuDoSoLuongDTO;
import com.example.demo.entity.dto.ThongKeDoanhThuDTO;
import com.example.demo.entity.sanpham.Ao;
import com.example.demo.entity.sanpham.AoChiTiet;
import com.example.demo.repo.sanpham.AoChiTietRepo;
import com.example.demo.ser.users.HoaDonChiTietSer;
import com.example.demo.ser.users.HoaDonSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@RestController
public class ApiController {
    @Autowired
    HoaDonSer hoaDonSer;

    @Autowired
    HoaDonChiTietSer hoaDonChiTietSer;

    @Autowired
    AoChiTietRepo aoChiTietRepo;
    private BieuDoDoanhThuDTO chartData = new BieuDoDoanhThuDTO();

    private BieuDoSoLuongDTO chartData1 = new BieuDoSoLuongDTO();

    private ThongKeDoanhThuDTO thongKeDoanhThuDTO = new ThongKeDoanhThuDTO();
    @GetMapping("/api/chart-data-doanhthu")
    public BieuDoDoanhThuDTO getChartData(@RequestParam String startDate, @RequestParam String endDate) {
        LocalDate date1=null,date2=null;

        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // Định dạng ngày
            date1 = LocalDate.parse(startDate, formatter);
            date2 = LocalDate.parse(endDate, formatter);
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Double> getDoanhThu = hoaDonSer.doanhThuTheoThang(date1,date2);
        List<Integer> thang = hoaDonSer.getDataThang(date1,date2);

        List<Integer> monthsInPeriod = new ArrayList<>();
        LocalDate currentDate = date1;
        while (!currentDate.isAfter(date2)) {
            monthsInPeriod.add(currentDate.getMonthValue());
            currentDate = currentDate.plusMonths(1);
        }
        List<String> getThang = new ArrayList<>();
        for (int i = 0; i < monthsInPeriod.size(); i++) {
            String a="Thg "+monthsInPeriod.get(i);
            getThang.add(a);
        }
        System.out.println(monthsInPeriod.size());
        List<Double> finalResult = new ArrayList<>();
        for (Integer month : monthsInPeriod) {
            boolean found = false;
            for (int i = 0; i < getDoanhThu.size(); i++) {
                if (month == thang.get(i)) {
                    finalResult.add(getDoanhThu.get(i));
                    found = true;
                    break;
                }
            }
            if (!found) {
                finalResult.add(0.0);
            }
        }

        chartData.setLabels(getThang);
        chartData.setDatasetData(finalResult);
        return chartData;
    }
    @GetMapping("/api/chart-data-soluongban")
    public BieuDoSoLuongDTO getChartData1(@RequestParam String startDate, @RequestParam String endDate) {
        LocalDate date1=null,date2=null;

        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // Định dạng ngày
            date1 = LocalDate.parse(startDate, formatter);
            date2 = LocalDate.parse(endDate, formatter);
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Integer> getSoLuong = hoaDonChiTietSer.soLuongBanTheoThang(date1,date2);
        List<Integer> thang = hoaDonSer.getDataThang(date1,date2);

        List<Integer> monthsInPeriod = new ArrayList<>();
        LocalDate currentDate = date1;
        while (!currentDate.isAfter(date2)) {
            monthsInPeriod.add(currentDate.getMonthValue());
            currentDate = currentDate.plusMonths(1);
        }
        List<String> getThang = new ArrayList<>();
        for (int i = 0; i < monthsInPeriod.size(); i++) {
            String a="Thg "+monthsInPeriod.get(i);
            getThang.add(a);
        }
        System.out.println(getThang.size());
        List<Integer> finalResult = new ArrayList<>();
        for (Integer month : monthsInPeriod) {
            boolean found = false;
            for (int i = 0; i < getSoLuong.size(); i++) {
                if (month == thang.get(i)) {
                    finalResult.add(getSoLuong.get(i));
                    found = true;
                    break;
                }
            }
            if (!found) {
                finalResult.add(0);
            }
        }

        chartData1.setLabels(getThang);
        chartData1.setDatasetData(finalResult);
        return chartData1;
    }
    @GetMapping("/api/thongketheoOption")
    public ThongKeDoanhThuDTO getThongKe(@RequestParam String thongKeOption, Model model){
        LocalDate ngayHienTai = LocalDate.now();
        LocalDate ngayHomTruoc = ngayHienTai.minus(1, ChronoUnit.DAYS);
        LocalDate lastMonth = ngayHienTai.minusMonths(1);

        if ("ngay".equals(thongKeOption)) {
            Integer soDonNgayHienTai = hoaDonSer.soLuongHoaDonHoanThanhTheoNgay(ngayHienTai);
            Integer soDonNgayHomTruoc = hoaDonSer.soLuongHoaDonHoanThanhTheoNgay(ngayHomTruoc);

            if (soDonNgayHienTai == null) {
                soDonNgayHienTai = 0;
            }
            if (soDonNgayHomTruoc == null) {
                soDonNgayHomTruoc = 0;
            }

            Integer soLuongBanNgayHienTai = hoaDonChiTietSer.soLuongBanTheoNgay(ngayHienTai);
            Integer soLuongBanNgayTruoc = hoaDonChiTietSer.soLuongBanTheoNgay(ngayHomTruoc);

            if (soLuongBanNgayHienTai == null) {
                soLuongBanNgayHienTai = 0;
            }
            if (soLuongBanNgayTruoc == null) {
                soLuongBanNgayTruoc = 0;
            }

            Double doanhThuNgayHienTai = hoaDonSer.doanhThuTheoNgay(ngayHienTai);
            Double doanhThuNgayTruocStr = hoaDonSer.doanhThuTheoNgay(ngayHomTruoc);


            if (doanhThuNgayHienTai == null) {
                doanhThuNgayHienTai = 0.0;
            }
            if (doanhThuNgayTruocStr == null) {
                doanhThuNgayTruocStr = 0.0;
            }

            Integer soLuongKhachMuaNgayHienTai = hoaDonSer.soLuongKhachMuaTheoNgay(ngayHienTai);
            Integer soLuongKhachMuaNgayTruocStr = hoaDonSer.soLuongKhachMuaTheoNgay(ngayHomTruoc);


            if (soLuongKhachMuaNgayHienTai == null) {
                soLuongKhachMuaNgayHienTai = 0;
            }
            if (soLuongKhachMuaNgayTruocStr == null) {
                soLuongKhachMuaNgayTruocStr = 0;
            }
            DecimalFormat df = new DecimalFormat("0.00");
            double soSanhHoaDon;
            if(soDonNgayHomTruoc==0){
                soSanhHoaDon=100;
            }
            else{
                soSanhHoaDon= ((double)(soDonNgayHienTai - soDonNgayHomTruoc) / soDonNgayHomTruoc) * 100;
            }
            String formatSoSanhHoaDon = df.format(soSanhHoaDon);
            if(soSanhHoaDon>=0){
                formatSoSanhHoaDon = "+"+formatSoSanhHoaDon;
            }

            double soSanhSoLuongBan;

            if (soLuongBanNgayTruoc == 0) {
                soSanhSoLuongBan = soLuongBanNgayHienTai;
            } else {
                soSanhSoLuongBan = ((double)(soLuongBanNgayHienTai - soLuongBanNgayTruoc) / soLuongBanNgayTruoc) * 100;
            }

            String formatSoSanhSoLuong = df.format(soSanhSoLuongBan);
            if(soSanhSoLuongBan>=0){
                formatSoSanhSoLuong = "+"+formatSoSanhSoLuong;
            }

            double soSanhDoanhThu ;

            if (doanhThuNgayTruocStr == 0.0){
                soSanhDoanhThu = doanhThuNgayHienTai;
            }else {
                soSanhDoanhThu = ((doanhThuNgayHienTai - doanhThuNgayTruocStr) / doanhThuNgayTruocStr) * 100;
            }
            String formatSoSanhDoanhThu = df.format(soSanhDoanhThu);
            if(soSanhDoanhThu>=0){
                formatSoSanhDoanhThu = "+"+formatSoSanhDoanhThu;
            }

            double soSanhSoLuongKhach;

            if (soLuongKhachMuaNgayTruocStr == 0){
                soSanhSoLuongKhach = soLuongKhachMuaNgayHienTai;
            }else {
                soSanhSoLuongKhach = ((double)(soLuongKhachMuaNgayHienTai - soLuongKhachMuaNgayTruocStr) / soLuongKhachMuaNgayTruocStr) * 100;
            }

            String formatSoSanhSoLuongKhach = df.format(soSanhSoLuongKhach);
            if(soSanhSoLuongKhach>=0){
                formatSoSanhSoLuongKhach = "+"+formatSoSanhSoLuongKhach;
            }

            thongKeDoanhThuDTO.setSoLuongHoaDon(soDonNgayHienTai);
            thongKeDoanhThuDTO.setSoluongBan(soLuongBanNgayHienTai);
            thongKeDoanhThuDTO.setDoanhThu(doanhThuNgayHienTai);
            thongKeDoanhThuDTO.setSoLuongKhachMua(soLuongKhachMuaNgayHienTai);
            thongKeDoanhThuDTO.setSoSanhSoHoaDon(formatSoSanhHoaDon);
            thongKeDoanhThuDTO.setSoSanhSoLuongBan(formatSoSanhSoLuong);
            thongKeDoanhThuDTO.setSoSanhDoanhThu(formatSoSanhDoanhThu);
            thongKeDoanhThuDTO.setSoSanhSoLuongKhachMua(formatSoSanhSoLuongKhach);
        } else if ("thang".equals(thongKeOption)) {
            Integer soDonNgayHienTai = hoaDonSer.soHoaDonTrongThang(ngayHienTai);
            Integer soDonNgayHomTruoc = hoaDonSer.soHoaDonTrongThang(lastMonth);

            if (soDonNgayHienTai == null) {
                soDonNgayHienTai = 0;
            }
            if (soDonNgayHomTruoc == null) {
                soDonNgayHomTruoc = 0;
            }

            Integer soLuongBanNgayHienTai = hoaDonChiTietSer.soLuongBanTrongThang(ngayHienTai);
            Integer soLuongBanNgayTruoc = hoaDonChiTietSer.soLuongBanTrongThang(lastMonth);

            if (soLuongBanNgayHienTai == null) {
                soLuongBanNgayHienTai = 0;
            }
            if (soLuongBanNgayTruoc == null) {
                soLuongBanNgayTruoc = 0;
            }

            Double doanhThuNgayHienTai = hoaDonSer.doanhThuThang(ngayHienTai);
            Double doanhThuNgayTruocStr = hoaDonSer.doanhThuThang(lastMonth);


            if (doanhThuNgayHienTai == null) {
                doanhThuNgayHienTai = 0.0;
            }
            if (doanhThuNgayTruocStr == null) {
                doanhThuNgayTruocStr = 0.0;
            }

            Integer soLuongKhachMuaNgayHienTai = hoaDonSer.soLuongKhachMuaTrongThang(ngayHienTai);
            Integer soLuongKhachMuaNgayTruocStr = hoaDonSer.soLuongKhachMuaTrongThang(lastMonth);


            if (soLuongKhachMuaNgayHienTai == null) {
                soLuongKhachMuaNgayHienTai = 0;
            }
            if (soLuongKhachMuaNgayTruocStr == null) {
                soLuongKhachMuaNgayTruocStr = 0;
            }
            DecimalFormat df = new DecimalFormat("0.00");
            double soSanhHoaDon;
            if(soDonNgayHomTruoc==0){
                soSanhHoaDon=100;
            }
            else{
                soSanhHoaDon= ((double)(soDonNgayHienTai - soDonNgayHomTruoc) / soDonNgayHomTruoc) * 100;
            }
            String formatSoSanhHoaDon = df.format(soSanhHoaDon);
            if(soSanhHoaDon>=0){
                formatSoSanhHoaDon = "+"+formatSoSanhHoaDon;
            }

            double soSanhSoLuongBan;

            if (soLuongBanNgayTruoc == 0) {
                soSanhSoLuongBan = soLuongBanNgayHienTai;
            } else {

                soSanhSoLuongBan = ((double)(soLuongBanNgayHienTai -  soLuongBanNgayTruoc) / soLuongBanNgayTruoc) * 100;
            }

            String formatSoSanhSoLuong = df.format(soSanhSoLuongBan);
            if(soSanhSoLuongBan>=0){
                formatSoSanhSoLuong = "+"+formatSoSanhSoLuong;
            }

            double soSanhDoanhThu ;

            if (doanhThuNgayTruocStr == 0.0){
                soSanhDoanhThu = doanhThuNgayHienTai;
            }else {
                soSanhDoanhThu = ((doanhThuNgayHienTai - doanhThuNgayTruocStr) / doanhThuNgayTruocStr) * 100;
            }
            String formatSoSanhDoanhThu = df.format(soSanhDoanhThu);
            if(soSanhDoanhThu>=0){
                formatSoSanhDoanhThu = "+"+formatSoSanhDoanhThu;
                model.addAttribute("mauDT", "success");
            }
            else{
                model.addAttribute("mauDT", "danger");
            }

            double soSanhSoLuongKhach;

            if (soLuongKhachMuaNgayTruocStr == 0){
                soSanhSoLuongKhach = soLuongKhachMuaNgayHienTai;
            }else {
                soSanhSoLuongKhach = ((double)(soLuongKhachMuaNgayHienTai - soLuongKhachMuaNgayTruocStr) / soLuongKhachMuaNgayTruocStr) * 100;
            }

            String formatSoSanhSoLuongKhach = df.format(soSanhSoLuongKhach);
            if(soSanhSoLuongKhach>=0){
                formatSoSanhSoLuongKhach = "+"+formatSoSanhSoLuongKhach;
            }

            thongKeDoanhThuDTO.setSoLuongHoaDon(soDonNgayHienTai);
            thongKeDoanhThuDTO.setSoluongBan(soLuongBanNgayHienTai);
            thongKeDoanhThuDTO.setDoanhThu(doanhThuNgayHienTai);
            thongKeDoanhThuDTO.setSoLuongKhachMua(soLuongKhachMuaNgayHienTai);
            thongKeDoanhThuDTO.setSoSanhSoHoaDon(formatSoSanhHoaDon);
            thongKeDoanhThuDTO.setSoSanhSoLuongBan(formatSoSanhSoLuong);
            thongKeDoanhThuDTO.setSoSanhDoanhThu(formatSoSanhDoanhThu);
            thongKeDoanhThuDTO.setSoSanhSoLuongKhachMua(formatSoSanhSoLuongKhach);
            System.out.println(soLuongBanNgayHienTai+" aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"+ soLuongBanNgayTruoc+ formatSoSanhSoLuong);
        }
        return thongKeDoanhThuDTO;
    }
    @GetMapping("/api/listTon")
    public List<Integer> getListTon(@RequestParam String loaiAo, @RequestParam String tenAo, @RequestParam String mauSac) {
        List<AoChiTiet> listTon = aoChiTietRepo.listSoLuongbyMauAo(loaiAo,tenAo,mauSac);
        System.out.println(listTon.size());
        List<Integer> listSl = Arrays.asList(0, 0, 0, 0, 0, 0);
        for (AoChiTiet aoChiTiet: listTon
        ) {
            if (aoChiTiet.getSize().getMa().equals("L")){
                listSl.set(0,aoChiTiet.getSlton());
            }
            if (aoChiTiet.getSize().getMa().equals("XXL")){
                listSl.set(1,aoChiTiet.getSlton());
            }
            if (aoChiTiet.getSize().getMa().equals("S")){
                listSl.set(2,aoChiTiet.getSlton());
            }
            if (aoChiTiet.getSize().getMa().equals("M")){
                listSl.set(3,aoChiTiet.getSlton());
            }
            if (aoChiTiet.getSize().getMa().equals("XXXL")){
                listSl.set(4,aoChiTiet.getSlton());
            }
            if (aoChiTiet.getSize().getMa().equals("XL")){
                listSl.set(5,aoChiTiet.getSlton());
            }
        }
        System.out.println(listSl.size()+"aaaaaaaaaaaaaaaaaaaaaaaaaaa");
        return listSl;
    }

    @GetMapping("/api/listAo")
    public List<String> getListAo(@RequestParam String loaiAo) {
        List<Ao> listAo = aoChiTietRepo.listAoByLoaiAo(loaiAo);
        System.out.println(listAo.size()+"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        List<String>  tenAo = new ArrayList<>();
        for (Ao ao: listAo
        ) {
            tenAo.add(ao.getTen());
            System.out.println(ao.getTen());
        }
        return tenAo;
    }
}
