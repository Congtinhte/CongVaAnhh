package com.example.demo.controller.admin.sanpham;

import com.example.demo.entity.sanpham.Form;
import com.example.demo.ser.sanpham.FormSer;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.UUID;

@Controller
public class FormController {

    @Autowired
    FormSer formSer;

    @GetMapping("/admin/form/view/*")
    public String view(Model model, HttpServletRequest request) {

        List<Form> listForms = formSer.getAll();
        model.addAttribute("listForms", listForms);

        String url = request.getRequestURI();
        String[] parts = url.split("/admin/form/view/");
        String id = parts[1];

        try {
            Form form = formSer.findById(UUID.fromString(id));
            model.addAttribute("item", form);
        } catch (Exception e) {

        }

        return "/admin/form";
    }

    @PostMapping("/admin/form/add")
    public String add(Model model, HttpServletRequest request) {

        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        String trangthai = request.getParameter("trangthai");

        Form form = new Form();

        form.setMa(ma);
        form.setTen(ten);
        form.setTrangthai(Integer.parseInt(trangthai));

        formSer.add(form);
        return "redirect:/admin/form/view/1";
    }

    @PostMapping("/admin/form/update")
    public String update(Model model, HttpServletRequest request) {

        String id = request.getParameter("id");
        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        String trangthai = request.getParameter("trangthai");

        Form form = new Form();

        form.setMa(ma);
        form.setTen(ten);
        form.setTrangthai(Integer.parseInt(trangthai));

        formSer.update(UUID.fromString(id), form);
        return "redirect:/admin/form/view/1";
    }

    @PostMapping("/admin/form/detail")
    public String detail(Model model, HttpServletRequest request) {

        String id = request.getParameter("detail");
        Form form = formSer.findById(UUID.fromString(id));

        return "redirect:/admin/form/view/"+ form.getId();
    }

    @PostMapping("/admin/form/clear")
    public String clear() {
        return "redirect:/admin/form/view/1";
    }
}
