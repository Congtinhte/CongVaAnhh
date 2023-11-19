<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>MultiShop - Online Shop Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="../../../resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../../../resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="../../../resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../../../resources/css/style.css" rel="stylesheet">
    <style>
        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .payment-methods {
            padding: 10px 0;
        }

        #ctgg-details,
        #banking-image,
        #cash-details {
            display: none;
        }

        button[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
    <style>
        .close-btn {
            cursor: pointer;
            color: blue;
            text-decoration: underline;
        }

        #condition-popup {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            padding-left: 20%;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            z-index: 999;
            justify-content: center;
            align-items: center;
        }

        .condition-content {
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            width: 80%;
        }

        .voucher-list {
            list-style-type: none;
            padding: 0;
        }

        .voucher-details {
            display: flex;
            align-items: center;
            margin-bottom: 10px; /* Điều chỉnh khoảng cách giữa các voucher */
        }

        .radio-label {
            margin-right: 10px; /* Điều chỉnh khoảng cách giữa ô radio và tên voucher */
        }

        .voucher-condition {
            font-size: 12px;
        }

        /* Các quy tắc CSS khác ở đây */

    </style>
</head>

<body>
<!-- Topbar Start -->
<div class="container-fluid">
    <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
        <div class="col-lg-4">
            <a href="/user/trang_chu/${idKh}" class="text-decoration-none">
                <span class="h1 text-uppercase text-primary bg-dark px-2">SD</span>
                <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">99</span>
            </a>
        </div>
        <div class="col-lg-4 col-6 text-left">
            <form method="post">
                <div class="input-group">
                    <input type="text" class="form-control" name="timKiem" placeholder="Search for products">
                    <div class="input-group-append">
                        <button class="input-group-text bg-transparent text-primary"
                                formaction="/user/tim_kiem/${idKh}">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-4 col-6 text-right">
            <p class="m-0">Customer Service</p>
            <h5 class="m-0">+012 345 6789</h5>
        </div>
    </div>
</div>
<!-- Topbar End -->

${ngayTao}
<!-- Navbar Start -->
<div class="container-fluid bg-dark mb-30">
    <div class="row px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse"
               href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>Categories</h6>
                <i class="fa fa-angle-down text-dark"></i>
            </a>
            <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light"
                 id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                <div class="navbar-nav w-100">
                    <div class="nav-item dropdown dropright">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Dresses <i
                                class="fa fa-angle-right float-right mt-1"></i></a>
                        <div class="dropdown-menu position-absolute rounded-0 border-0 m-0">
                            <a href="" class="dropdown-item">Men's Dresses</a>
                            <a href="" class="dropdown-item">Women's Dresses</a>
                            <a href="" class="dropdown-item">Baby's Dresses</a>
                        </div>
                    </div>
                    <a href="" class="nav-item nav-link">Shirts</a>
                    <a href="" class="nav-item nav-link">Jeans</a>
                    <a href="" class="nav-item nav-link">Swimwear</a>
                    <a href="" class="nav-item nav-link">Sleepwear</a>
                    <a href="" class="nav-item nav-link">Sportswear</a>
                    <a href="" class="nav-item nav-link">Jumpsuits</a>
                    <a href="" class="nav-item nav-link">Blazers</a>
                    <a href="" class="nav-item nav-link">Jackets</a>
                    <a href="" class="nav-item nav-link">Shoes</a>
                </div>
            </nav>
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                <a href="" class="text-decoration-none d-block d-lg-none">
                    <span class="h1 text-uppercase text-dark bg-light px-2">Multi</span>
                    <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Shop</span>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a href="index.html" class="nav-item nav-link">Home</a>
                        <a href="shop.html" class="nav-item nav-link">Shop</a>
                        <a href="detail.html" class="nav-item nav-link">Shop Detail</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle active" data-toggle="dropdown">Pages <i
                                    class="fa fa-angle-down mt-1"></i></a>
                            <div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
                                <a href="cart.html" class="dropdown-item">Shopping Cart</a>
                                <a href="checkout.html" class="dropdown-item active">Checkout</a>
                            </div>
                        </div>
                        <a href="contact.html" class="nav-item nav-link">Contact</a>
                    </div>
                    <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                        <c:choose>
                            <c:when test="${idKh != 2}">
                                <a href="/user/don_hang/${idKh}" class="btn px-0">
                                    <i class="fa fa-user"></i>
                                    <span class="badge text-secondary border border-secondary rounded-circle"
                                          style="padding-bottom: 2px;">${idKh}</span>
                                </a>
                                <a href="/user/gio_hang/view/${idKh}" class="btn px-0 ml-3">
                                    <i class="fas fa-shopping-cart text-primary"></i>
                                    <span class="badge text-secondary border border-secondary rounded-circle"
                                          style="padding-bottom: 2px;">${soLuongSanPham}</span>
                                </a>
                            </c:when>
                            <c:when test="${idKh == 2}">
                                <a href="" class="btn px-0 ml-3">
                                    <i class="fas fa-user text-primary"></i>
                                </a>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<!-- Navbar End -->


<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="#">Home</a>
                <a class="breadcrumb-item text-dark" href="#">Shop</a>
                <span class="breadcrumb-item active">Checkout</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Checkout Start -->
<div class="container-fluid">
    <form method="post">
        <div class="row px-xl-5">
            <div class="col-lg-6">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Địa chỉ nhận hàng</span>
                </h5>
                <input type="checkbox" name="diaChiChon" value="diaChiCu" id="checkbox1" onchange="kiemTraDiaChiCu()">Địa
                chỉ ban đầu
                <div id="view_dia_chi_cu" style="display:block">
                    <div class="bg-light p-30 mb-5">
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label>Họ tên</label>
                                <input class="form-control" type="text" name="ten" value="${khachHang.ten}"
                                       placeholder="${khachHang.ten}"
                                       readonly>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Email</label>
                                <input class="form-control" type="text" name="email" value="${khachHang.email}"
                                       placeholder="${khachHang.email}"
                                       readonly>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Số điện thoại</label>
                                <input class="form-control" type="text" name="sdt" value="${khachHang.sdt}"
                                       placeholder="${khachHang.sdt}"
                                       readonly>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Quốc gia</label>
                                <input class="form-control" type="text" name="quocGia"
                                       placeholder="${khachHang.quoc_gia}" value="${khachHang.quoc_gia}" readonly>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Thành phố</label>
                                <input class="form-control" type="text" name="thanhPho"
                                       placeholder="${khachHang.thanh_pho}" value="${khachHang.thanh_pho}" id="diaChiCu"
                                       readonly>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Địa chỉ</label>
                                <input class="form-control" type="text" name="diaChi" value="${khachHang.dia_chi}"
                                       placeholder="${khachHang.dia_chi}"
                                       readonly>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="checkbox" name="diaChiChon" value="diaChiMoi" id="checkbox2"
                       onclick="toggleView('view_dia_chi_moi')">Địa
                chỉ
                mới
                <div id="view_dia_chi_moi" style="display:none">
                    <div class="bg-light p-30 mb-5">
                        <div class="bg-light p-30 mb-5">
                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label>Họ tên</label>
                                    <input class="form-control" name="ten1" type="text" placeholder="Họ tên">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Email</label>
                                    <input class="form-control" name="email1" type="text" placeholder="Email">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Số điện thoại</label>
                                    <input class="form-control" name="sdt1" type="text" placeholder="Số điện thoại">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Quốc gia</label>
                                    <input class="form-control" name="quocGia1" type="text" placeholder="Quôc gia">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Thành phố</label>

                                    <input class="form-control" name="thanhPho1" id="diaChiMoi"
                                           oninput="kiemTraDiaChiMoi()" type="text" placeholder="Thành phố">

                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Địa chỉ</label>
                                    <input class="form-control" name="diaChi1" type="text" placeholder="Địa chỉ">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-lg-6">
                <h5 class="section-title position-relative text-uppercase mb-3"><span
                        class="bg-secondary pr-3">Order Total</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="border-bottom">
                        <h6 class="mb-3">Sản phẩm</h6>
                        <c:forEach items="${listHoaDonChiTietDTOS}" var="list" varStatus="vTri">
                            <div class="d-flex justify-content-between ">
                                <p><img style="width: 50px"
                                        src="/images/${list.hoaDonChiTiet.aoChiTiet.ao.anhs.get(0).ten_url}"></p>
                                <p style="width: 200px">${list.hoaDonChiTiet.aoChiTiet.ao.ten}</p>
                                <p><fmt:formatNumber value="${list.gia}" type="currency" currencySymbol="VNĐ"/></p>
                                <p>${list.hoaDonChiTiet.soLuong}</p>
                            </div>
                            <input type="hidden" id="slTon${vTri.index + 1}" value="${list.hoaDonChiTiet.aoChiTiet.slton}">
                            <input type="hidden" id="sl${vTri.index + 1}" value="${list.hoaDonChiTiet.soLuong}">
                        </c:forEach>
                    </div>
                    <div class="border-bottom pt-3 pb-2">
                        <div class="border-bottom pt-3 pb-2">
                            <div class="d-flex justify-content-between mb-3">
                                <h6>Đơn giá</h6>
                                <h6>
                                    <fmt:formatNumber value="${tongTien}" type="currency" currencySymbol="VNĐ"/>
                                </h6>
                            </div>
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-medium">Ship</h6>
                                <h6 class="font-weight-medium">
                                    <input type="text" id="ship" readonly
                                           style="border: none; background: none; text-align: left;padding-left: 50%">
                                </h6>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="price">Giá tiền:</label>
                            <input type="text" id="price" value="${tongTien}" readonly>
                            <input type="hidden" id="price1" name="tongTien" readonly>
                        </div>
                        <div class="form-group">
                            <div class="payment-methods">
                                <label>
                                    <p style="padding-top: 5px" onclick="toggleView('view_anh2')">Chương trình giảm giá
                                        <i class="fas fa-angle-down"></i></p>
                                </label>
                            </div>
                            <div id="view_anh2" style="display:none">
                                <div class="voucher-list">
                                    <c:forEach items="${CTGG}" var="list">
                                        <div class="voucher-details">
                                            <input name="options" type="radio" value="${list.phanTramGiam}"
                                                   onclick="updatePrice(this)"
                                                   <c:if test="${list.soLuongSanPham > slDK || list.soTienHoaDon > tongTienDK}">disabled</c:if>>
                                            <label for="${list.ma}" class="radio-label"></label>
                                            <span class="voucher-name">${list.ten}</span>
                                            <span class="voucher-condition" style="margin-left: 20px;"><a href="#"
                                                                                                          style=" color: #0e84b5"
                                                                                                          onclick="showCondition('Số sản phẩm trên ${list.soLuongSanPham} và tổng tiền hóa đơn trên ${list.soTienHoaDon}')">Xem điều kiện</a></span>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>

                            <div id="condition-popup" style="display: none;">
                                <div class="condition-content">
                                    <span class="close-btn" onclick="closeCondition()">Đóng</span>
                                    <div id="condition-text"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mb-5">
                    <h5 class="section-title position-relative text-uppercase mb-3"><span
                            class="bg-secondary pr-3">Payment</span></h5>
                    <div class="bg-light p-30">
                        <div class="form-group mb-4">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" value="bank" name="payment"
                                       id="banktransfer">
                                <label class="custom-control-label" for="banktransfer">Thanh toán vnpay</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" value="cash" name="payment"
                                       id="directcheck">
                                <label class="custom-control-label" for="directcheck">Thanh toán khi nhận hàng</label>
                            </div>
                        </div>
                        <button class="btn btn-block btn-primary font-weight-bold py-3"
                                formaction="/user/hoa_don/dat_hang/${idHoaDon}" onclick="kiemTra()">Đặt hàng
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- Checkout End -->


<!-- Footer Start -->
<div class="container-fluid bg-dark text-secondary mt-5 pt-5">
    <div class="row px-xl-5 pt-5">
        <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
            <h5 class="text-secondary text-uppercase mb-4">Get In Touch</h5>
            <p class="mb-4">No dolore ipsum accusam no lorem. Invidunt sed clita kasd clita et et dolor sed dolor. Rebum
                tempor no vero est magna amet no</p>
            <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, New York, USA</p>
            <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@example.com</p>
            <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
        </div>
        <div class="col-lg-8 col-md-12">
            <div class="row">
                <div class="col-md-4 mb-5">
                    <h5 class="text-secondary text-uppercase mb-4">Quick Shop</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Home</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                        <a class="text-secondary" href="#"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <h5 class="text-secondary text-uppercase mb-4">My Account</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Home</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                        <a class="text-secondary" href="#"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <h5 class="text-secondary text-uppercase mb-4">Newsletter</h5>
                    <p>Duo stet tempor ipsum sit amet magna ipsum tempor est</p>
                    <form action="">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Your Email Address">
                            <div class="input-group-append">
                                <button class="btn btn-primary">Sign Up</button>
                            </div>
                        </div>
                    </form>
                    <h6 class="text-secondary text-uppercase mt-4 mb-3">Follow Us</h6>
                    <div class="d-flex">
                        <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a class="btn btn-primary btn-square" href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row border-top mx-xl-5 py-4" style="border-color: rgba(256, 256, 256, .1) !important;">
        <div class="col-md-6 px-xl-0">
            <p class="mb-md-0 text-center text-md-left text-secondary">
                &copy; <a class="text-primary" href="#">Domain</a>. All Rights Reserved. Designed
                by
                <a class="text-primary" href="https://htmlcodex.com">HTML Codex</a>
            </p>
        </div>
        <div class="col-md-6 px-xl-0 text-center text-md-right">
            <img class="img-fluid" src="img/payments.png" alt="">
        </div>
    </div>
</div>
<!-- Footer End -->


<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/lib/easing/easing.min.js"></script>
<script src="../../../resources/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="../../../resources/mail/jqBootstrapValidation.min.js"></script>
<script src="../../../resources/mail/contact.js"></script>

<!-- Template Javascript -->
<script src="../../../resources/js/main.js"></script>
<script>

    var gia = parseFloat(document.getElementById("price").value);
    var gia1 = gia;
    document.getElementById("price1").value = gia1.toFixed(0);

    var gia1Formatted1 = gia.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});

    var gia1WithCurrency1 = gia1Formatted1 + " VNĐ";

    document.getElementById("price").value = gia1WithCurrency1;

    function togglePaymentDetails1() {
        var ctggDetails = document.getElementById("ctgg-details");
        var ctggRadio = document.getElementById("ctgg");

        if (ctggRadio.checked) {
            ctggDetails.style.display = "block";
        }
    }

    function updatePrice(radioButton) {
        var priceInput = document.getElementById("price");
        var currentPrice = parseFloat(${tongTien});
        var selectedValue = parseFloat(radioButton.value);
        var newPrice = currentPrice - (currentPrice * selectedValue / 100);

        var gia1Formatted = newPrice.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});

        var gia1WithCurrency = gia1Formatted + " VNĐ";

        priceInput.value = gia1WithCurrency;
    }

    function toggleView(elementId) {
        var element = document.getElementById(elementId);
        element.style.display = (element.style.display === "block") ? "none" : "block";
    }

    function toggleView(elementId) {
        var element = document.getElementById(elementId);
        element.style.display = (element.style.display === "block") ? "none" : "block";
    }
</script>
<script>
    function showCondition(condition) {
        document.getElementById("condition-text").innerHTML = condition;
        document.getElementById("condition-popup").style.display = "block";
    }

    function closeCondition() {
        document.getElementById("condition-popup").style.display = "none";
    }
</script>
<script>

    var checkbox1 = document.getElementById("checkbox1");
    var checkbox2 = document.getElementById("checkbox2");

    // Thêm sự kiện cho checkbox1 để kiểm tra trạng thái của checkbox2
    checkbox1.addEventListener("change", function () {
        if (checkbox1.checked) {
            checkbox2.checked = false;
        }
    });

    // Thêm sự kiện cho checkbox2 để kiểm tra trạng thái của checkbox1
    checkbox2.addEventListener("change", function () {
        if (checkbox2.checked) {
            checkbox1.checked = false;
        }
    });

    // JavaScript code để kiểm tra địa chỉ cũ
    function kiemTraDiaChiCu() {
        var diaChiCu = document.getElementById("diaChiCu").value;
        var priceInput = document.getElementById("price");
        var priceInput1 = document.getElementById("price1");
        var currentPrice = parseFloat(${tongTien});
        if (diaChiCu.includes("Hà Nội")) {
            var ship = 20000;
        } else if (diaChiCu.includes("Bắc Ninh")) {
            var ship = 25000;
        } else if (diaChiCu.includes("Hồ Chí Minh")) {
            var ship = 80000;
        } else if (diaChiCu.includes("Hải Dương")) {
            var ship = 25000;
        } else if (diaChiCu.includes("Quảng Ninh")) {
            var ship = 40000;
        }
        var tongSoTien = currentPrice + ship;
        priceInput1.value = tongSoTien;

        var gia1Formatted3 = ship.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});

        var gia1WithCurrency3 = gia1Formatted3 + " VNĐ";

        document.getElementById("ship").value = gia1WithCurrency3;

        var gia1Formatted2 = tongSoTien.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});

        var gia1WithCurrency2 = gia1Formatted2 + " VNĐ";

        priceInput.value = gia1WithCurrency2;
    }

    // JavaScript code để kiểm tra địa chỉ mới sau khi nhập xong và rời khỏi ô văn bản
    function kiemTraDiaChiMoi() {
        var diaChiMoi = document.getElementById("diaChiMoi").value;
        var priceInput = document.getElementById("price");
        var priceInput1 = document.getElementById("price1");
        var currentPrice = parseFloat(${tongTien});
        if (diaChiMoi.includes("Hà Nội")) {
            var ship = 20000;
        } else if (diaChiMoi.includes("Bắc Ninh")) {
            var ship = 25000;
        } else if (diaChiMoi.includes("Hồ Chí Minh")) {
            var ship = 80000;
        } else if (diaChiMoi.includes("Hải Dương")) {
            var ship = 25000;
        } else if (diaChiMoi.includes("Quảng Ninh")) {
            var ship = 40000;
        }

        var tongSoTien = currentPrice + ship;
        priceInput1.value = tongSoTien;

        var gia1Formatted3 = ship.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});

        var gia1WithCurrency3 = gia1Formatted3 + " VNĐ";

        document.getElementById("ship").value = gia1WithCurrency3;

        var gia1Formatted2 = tongSoTien.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});

        var gia1WithCurrency2 = gia1Formatted2 + " VNĐ";

        priceInput.value = gia1WithCurrency2;
    }
</script>
<script>
    function kiemTra() {

        for (var i = 0; i < 99; i++) {
            var slTon = parseFloat(document.getElementById("slTon" + (i + 1)).value); // Sửa lỗi ở đây
            var sl = parseFloat(document.getElementById("sl" + (i + 1)).value); // Sửa lỗi ở đây

            console.log(sl);
            console.log(slTon);

            if (sl > slTon) {
                alert('Số lượng chọn quá lớn cho sản phẩm vị trí ' + (i + 1));
                event.preventDefault();
            }
        }
    }
</script>
</body>

</html>