package com.example.demo.controller.admin.sanpham;

import com.example.demo.entity.sanpham.MauSac;
import com.example.demo.ser.sanpham.MauSacSer;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.UUID;

@Controller
public class MauSacController {

    @Autowired
    MauSacSer mauSacSer;

    @GetMapping("/admin/mau_sac/view/*")
    public String view(Model model, HttpServletRequest request) {

        List<MauSac> listMauSacs = mauSacSer.getAll();
        model.addAttribute("listMauSacs", listMauSacs);

        String url = request.getRequestURI();
        String[] parts = url.split("/admin/mau_sac/view/");
        String id = parts[1];

        try {
            MauSac mauSac = mauSacSer.findById(UUID.fromString(id));
            model.addAttribute("item", mauSac);
        } catch (Exception e) {

        }

        return "/admin/mau_sac";
    }

    @PostMapping("/admin/mau_sac/add")
    public String add(Model model, HttpServletRequest request) {

        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        String trangthai = request.getParameter("trangthai");

        MauSac mauSac = new MauSac();

        mauSac.setMa(ma);
        mauSac.setTen(ten);
        mauSac.setTrangthai(Integer.parseInt(trangthai));

        mauSacSer.add(mauSac);
        return "redirect:/admin/mau_sac/view/1";
    }

    @PostMapping("/admin/mau_sac/update")
    public String update(Model model, HttpServletRequest request) {

        String id = request.getParameter("id");
        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        String trangthai = request.getParameter("trangthai");

        MauSac mauSac = new MauSac();

        mauSac.setMa(ma);
        mauSac.setTen(ten);
        mauSac.setTrangthai(Integer.parseInt(trangthai));

        mauSacSer.update(UUID.fromString(id), mauSac);
        return "redirect:/admin/mau_sac/view/1";
    }

    @PostMapping("/admin/mau_sac/detail")
    public String detail(Model model, HttpServletRequest request) {

        String id = request.getParameter("detail");
        MauSac mauSac = mauSacSer.findById(UUID.fromString(id));

        return "redirect:/admin/mau_sac/view/"+ mauSac.getId();
    }

    @PostMapping("/admin/mau_sac/clear")
    public String clear() {
        return "redirect:/admin/mau_sac/view/1";
    }
}
