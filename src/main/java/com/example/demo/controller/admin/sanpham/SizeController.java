package com.example.demo.controller.admin.sanpham;

import com.example.demo.entity.sanpham.Size;
import com.example.demo.ser.sanpham.SizeSer;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.UUID;

@Controller
public class SizeController {

    @Autowired
    SizeSer sizeSer;

    @GetMapping("/admin/size/view/*")
    public String view(Model model, HttpServletRequest request) {

        List<Size> listSizes = sizeSer.getAll();
        model.addAttribute("listSizes", listSizes);

        String url = request.getRequestURI();
        String[] parts = url.split("/admin/size/view/");
        String id = parts[1];

        try {
            Size size = sizeSer.findById(UUID.fromString(id));
            model.addAttribute("item", size);
        } catch (Exception e) {

        }

        return "/admin/size";
    }

    @PostMapping("/admin/size/add")
    public String add(Model model, HttpServletRequest request) {

        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        String trangthai = request.getParameter("trangthai");

        Size size = new Size();

        size.setMa(ma);
        size.setTen(ten);
        size.setTrangthai(Integer.parseInt(trangthai));

        sizeSer.add(size);
        return "redirect:/admin/size/view/1";
    }

    @PostMapping("/admin/size/update")
    public String update(Model model, HttpServletRequest request) {

        String id = request.getParameter("id");
        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        String trangthai = request.getParameter("trangthai");

        Size size = new Size();

        size.setMa(ma);
        size.setTen(ten);
        size.setTrangthai(Integer.parseInt(trangthai));

        sizeSer.update(UUID.fromString(id), size);
        return "redirect:/admin/size/view/1";
    }

    @PostMapping("/admin/size/detail")
    public String detail(Model model, HttpServletRequest request) {

        String id = request.getParameter("detail");
        Size size = sizeSer.findById(UUID.fromString(id));

        return "redirect:/admin/size/view/"+ size.getId();
    }

    @PostMapping("/admin/size/clear")
    public String clear() {
        return "redirect:/admin/size/view/1";
    }
}
