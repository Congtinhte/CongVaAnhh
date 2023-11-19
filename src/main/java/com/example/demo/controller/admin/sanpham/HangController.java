package com.example.demo.controller.admin.sanpham;

import com.example.demo.entity.sanpham.Hang;
import com.example.demo.ser.sanpham.HangSer;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.UUID;

@Controller
public class HangController {

    @Autowired
    HangSer hangSer;

    @GetMapping("/admin/hang/view/*")
    public String view(Model model, HttpServletRequest request) {

        List<Hang> listHangs = hangSer.getAll();
        model.addAttribute("listHangs", listHangs);

        String url = request.getRequestURI();
        String[] parts = url.split("/admin/hang/view/");
        String id = parts[1];

        try {
            Hang hang = hangSer.findById(UUID.fromString(id));
            model.addAttribute("item", hang);
        } catch (Exception e) {

        }

        return "/admin/hang";
    }

    @PostMapping("/admin/hang/add")
    public String add(Model model, HttpServletRequest request) {

        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        String diaChi = request.getParameter("diaChi");
        String trangthai = request.getParameter("trangthai");

        Hang hang = new Hang();

        hang.setMa(ma);
        hang.setTen(ten);
        hang.setDiaChi(diaChi);
        hang.setTrangthai(Integer.parseInt(trangthai));

        hangSer.add(hang);
        return "redirect:/admin/hang/view/1";
    }

    @PostMapping("/admin/hang/update")
    public String update(Model model, HttpServletRequest request) {

        String id = request.getParameter("id");
        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        String diaChi = request.getParameter("diaChi");
        String trangthai = request.getParameter("trangthai");

        Hang hang = new Hang();

        hang.setMa(ma);
        hang.setTen(ten);
        hang.setDiaChi(diaChi);
        hang.setTrangthai(Integer.parseInt(trangthai));

        hangSer.update(UUID.fromString(id), hang);
        return "redirect:/admin/hang/view/1";
    }

    @PostMapping("/admin/hang/detail")
    public String detail(Model model, HttpServletRequest request) {

        String id = request.getParameter("detail");
        Hang hang = hangSer.findById(UUID.fromString(id));

        return "redirect:/admin/hang/view/"+ hang.getId();
    }

    @PostMapping("/admin/hang/clear")
    public String clear() {
        return "redirect:/admin/hang/view/1";
    }
}
