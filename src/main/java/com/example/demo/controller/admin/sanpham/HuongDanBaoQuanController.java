package com.example.demo.controller.admin.sanpham;

import com.example.demo.entity.sanpham.HuongDanBaoQuan;
import com.example.demo.ser.sanpham.HuongDanBaoQuanSer;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.UUID;

@Controller
public class HuongDanBaoQuanController {

    @Autowired
    HuongDanBaoQuanSer huongDanBaoQuanSer;

    @GetMapping("/admin/huong_dan_bao_quan/view/*")
    public String view(Model model, HttpServletRequest request) {
        List<HuongDanBaoQuan> listHuongDanBaoQuans = huongDanBaoQuanSer.getAll();
        model.addAttribute("listHuongDanBaoQuans", listHuongDanBaoQuans);

        String url = request.getRequestURI();
        String[] parts = url.split("/admin/huong_dan_bao_quan/view/");
        String id = parts[1];

        try {
            HuongDanBaoQuan huong_dan_bao_quan = huongDanBaoQuanSer.findById(UUID.fromString(id));
            model.addAttribute("item", huong_dan_bao_quan);
        } catch (Exception e) {

        }

        return "/admin/huong_dan_bao_quan";
    }

    @PostMapping("/admin/huong_dan_bao_quan/add")
    public String add(HttpServletRequest request) {
        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        String chitiet = request.getParameter("chitiet");
        String trangthai = request.getParameter("trangthai");

        HuongDanBaoQuan huongDanBaoQuan = new HuongDanBaoQuan();

        huongDanBaoQuan.setMa(ma);
        huongDanBaoQuan.setTen(ten);
        huongDanBaoQuan.setChitiet(chitiet);
        huongDanBaoQuan.setTrangthai(Integer.parseInt(trangthai));

        huongDanBaoQuanSer.add(huongDanBaoQuan);
        return "redirect:/admin/huong_dan_bao_quan/view/1";
    }

    @PostMapping("/admin/huong_dan_bao_quan/update")
    public String update(HttpServletRequest request) {
        String id = request.getParameter("id");
        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        String chitiet = request.getParameter("chitiet");
        String trangthai = request.getParameter("trangthai");

        HuongDanBaoQuan huongDanBaoQuan = new HuongDanBaoQuan();

        huongDanBaoQuan.setMa(ma);
        huongDanBaoQuan.setTen(ten);
        huongDanBaoQuan.setChitiet(chitiet);
        huongDanBaoQuan.setTrangthai(Integer.parseInt(trangthai));

        huongDanBaoQuanSer.update(UUID.fromString(id), huongDanBaoQuan);

        return "redirect:/admin/huong_dan_bao_quan/view/1";
    }

    @PostMapping("/admin/huong_dan_bao_quan/detail")
    public String detail(HttpServletRequest request) {
        String id = request.getParameter("detail");
        HuongDanBaoQuan huong_dan_bao_quan = huongDanBaoQuanSer.findById(UUID.fromString(id));

        return "redirect:/admin/huong_dan_bao_quan/view/" + huong_dan_bao_quan.getId();
    }

    @PostMapping("/admin/huong_dan_bao_quan/clear")
    public String clear() {
        return "redirect:/admin/huong_dan_bao_quan/view/1";
    }
}
