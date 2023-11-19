package com.example.demo.controller.admin.sanpham;

import com.example.demo.entity.sanpham.ChatVai;
import com.example.demo.entity.sanpham.HuongDanBaoQuan;
import com.example.demo.ser.sanpham.ChatVaiSer;
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
public class ChatVaiController {

    @Autowired
    ChatVaiSer chatVaiSer;

    @Autowired
    HuongDanBaoQuanSer huongDanBaoQuanSer;

    @GetMapping("/admin/chat_vai/view/*")
    public String view(Model model, HttpServletRequest request) {

        List<ChatVai> listChatVais = chatVaiSer.getAll();
        model.addAttribute("listChatVais", listChatVais);

        List<HuongDanBaoQuan> listHuongDanBaoQuans = huongDanBaoQuanSer.findByAllByTrangThai(1);
        model.addAttribute("listHuongDanBaoQuans", listHuongDanBaoQuans);

        String url = request.getRequestURI();
        String[] parts = url.split("/admin/chat_vai/view/");
        String id = parts[1];

        try {
            ChatVai chatVai = chatVaiSer.findById(UUID.fromString(id));
            model.addAttribute("item", chatVai);
        } catch (Exception e) {

        }

        return "/admin/chat_vai";
    }

    @PostMapping("/admin/chat_vai/add")
    public String add(HttpServletRequest request){
        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        String thongtin = request.getParameter("thongtin");
        String huongDanBaoQuanId = request.getParameter("huongDanBaoQuanId");
        String trangthai = request.getParameter("trangthai");

        HuongDanBaoQuan huong_dan_bao_quan = huongDanBaoQuanSer.findById(UUID.fromString(huongDanBaoQuanId));

        ChatVai chatVai = new ChatVai();

        chatVai.setMa(ma);
        chatVai.setTen(ten);
        chatVai.setThongtin(thongtin);
        chatVai.setHuong_dan_bao_quan(huong_dan_bao_quan);
        chatVai.setTrangthai(Integer.parseInt(trangthai));

        chatVaiSer.add(chatVai);

        return "redirect:/admin/chat_vai/view/1";
    }

    @PostMapping("/admin/chat_vai/update")
    public String update(HttpServletRequest request){
        String id = request.getParameter("id");
        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        String thongtin = request.getParameter("thongtin");
        String huongDanBaoQuanId = request.getParameter("huongDanBaoQuanId");
        String trangthai = request.getParameter("trangthai");

        HuongDanBaoQuan huong_dan_bao_quan = huongDanBaoQuanSer.findById(UUID.fromString(huongDanBaoQuanId));

        ChatVai chatVai = new ChatVai();

        chatVai.setMa(ma);
        chatVai.setTen(ten);
        chatVai.setThongtin(thongtin);
        chatVai.setHuong_dan_bao_quan(huong_dan_bao_quan);
        chatVai.setTrangthai(Integer.parseInt(trangthai));

        chatVaiSer.update(UUID.fromString(id),chatVai);

        return "redirect:/admin/chat_vai/view/1";
    }


    @PostMapping("/admin/chat_vai/detail")
    public String detail(HttpServletRequest request) {
        String id = request.getParameter("detail");
        ChatVai chatVai = chatVaiSer.findById(UUID.fromString(id));

        return "redirect:/admin/chat_vai/view/" + chatVai.getId();
    }

    @PostMapping("/admin/chat_vai/clear")
    public String clear() {
        return "redirect:/admin/chat_vai/view/1";
    }

}
