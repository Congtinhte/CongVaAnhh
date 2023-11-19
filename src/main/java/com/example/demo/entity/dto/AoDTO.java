package com.example.demo.entity.dto;

import com.example.demo.entity.sanpham.Ao;
import jakarta.persistence.Entity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AoDTO {

    Ao ao;

    Long slBan;

    int giaBan;
}
