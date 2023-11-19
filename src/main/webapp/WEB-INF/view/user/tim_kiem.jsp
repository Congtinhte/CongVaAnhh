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
</head>

<body>
<!-- Topbar Start -->
<div class="container-fluid">
    <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
        <div class="col-lg-4">
            <a href="/user/trang_chu/${idKh}" class="text-decoration-none">
                <span class="h1 text-uppercase text-primary bg-dark px-2">Multi</span>
                <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Shop</span>
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
                        <a href="shop.html" class="nav-item nav-link active">Shop</a>
                        <a href="detail.html" class="nav-item nav-link">Shop Detail</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages <i
                                    class="fa fa-angle-down mt-1"></i></a>
                            <div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
                                <a href="cart.html" class="dropdown-item">Shopping Cart</a>
                                <a href="checkout.html" class="dropdown-item">Checkout</a>
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
                <span class="breadcrumb-item active">Shop List</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Shop Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <!-- Shop Sidebar Start -->
        <div class="col-lg-3 col-md-4">
            <!-- Price Start -->
            <form method="post">
                <h5 class="section-title position-relative text-uppercase mb-3"><span
                        class="bg-secondary pr-3"><p style="display: inline-block;width: 100px">Giá </p><i style="display: inline-block" class="fas fa-angle-down"
                                                         onclick="toggleView('view_anh2')"></i></span>
                </h5>
                <div id="view_anh2" style="display:block">
                    <div class="bg-light p-4 mb-30">
                        <div class="custom-control custom-combobox d-flex align-items-center justify-content-between mb-3">
                            <select class="custom-select mr-2" id="minPrice" name="minPrice">
                                <option value="">Min</option>
                                <option value="100">10000</option>
                                <option value="200">20000</option>
                                <option value="300">30000</option>
                                <!-- Thêm các tùy chọn giá khác tùy theo nhu cầu của bạn -->
                            </select>

                            <!-- Combobox Max Giá -->
                            <select class="custom-select ml-2" id="maxPrice" name="maxPrice">
                                <option value="">Max</option>
                                <option value="500000">500000</option>
                                <option value="1000000">1000000</option>
                                <option value="1500000">1500000</option>
                                <!-- Thêm các tùy chọn giá khác tùy theo nhu cầu của bạn -->
                            </select>
                        </div>
                    </div>
                </div>
                <!-- Price End -->

                <!-- Color Start -->
                <h5 class="section-title position-relative text-uppercase mb-3"><span
                        class="bg-secondary pr-3"><p style="display: inline-block;width: 100px">Form </p><i style="display: inline-block" class="fas fa-angle-down"
                                                          onclick="toggleView('view_anh3')"></i></span>
                </h5>
                <div id="view_anh3" style="display:block">
                    <div class="bg-light p-4 mb-30">
                        <c:forEach items="${listForm}" var="list" varStatus="status">
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between">
                                <input type="radio" class="control-input" id="form-${status.index == 0 ? '0' : ''}"
                                       name="idForm" value="${list.id}">
                                <label for="form-${status.index == 0 ? '0' : ''}"
                                       style="width: 200px; padding-top: 8px">${list.ten}</label>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <h5 class="section-title position-relative text-uppercase mb-3"><span
                        class="bg-secondary pr-3"><p style="display: inline-block;width: 100px">Hãng </p><i style="display: inline-block" class="fas fa-angle-down"
                                                          onclick="toggleView('view_anh4')"></i></span>
                </h5>
                <div id="view_anh4" style="display:block">
                    <div class="bg-light p-4 mb-30">
                        <c:forEach items="${listHang}" var="list" varStatus="status">
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between">
                                <input type="radio" class="control-input" id="hang-${status.index == 0 ? '0' : ''}"
                                       name="idHang" value="${list.id}">
                                <label style="width: 200px; padding-top: 8px"
                                       for="hang-${status.index == 0 ? '0' : ''}">${list.ten}</label>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <h5 class="section-title position-relative text-uppercase mb-3"><span
                        class="bg-secondary pr-3"><p style="display: inline-block;width: 100px">Loại áo </p><i style="display: inline-block" class="fas fa-angle-down"
                                                             onclick="toggleView('view_anh5')"></i></span>
                </h5>
                <div id="view_anh5" style="display:block">
                    <div class="bg-light p-4 mb-30">
                        <c:forEach items="${listLoaiAo}" var="list" varStatus="status">
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between">
                                <input type="radio" class="control-input" id="loaiAo-${status.index == 0 ? '0' : ''}"
                                       name="idLoaiAo" value="${list.id}" ${list.id == loaiAo.id ?'checked':''}>
                                <label style="width: 200px; padding-top: 8px"
                                       for="loaiAo-${status.index == 0 ? '0' : ''}">${list.ten}</label>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <h5 class="section-title position-relative text-uppercase mb-3"><span
                        class="bg-secondary pr-3"><p style="display: inline-block;width: 100px">Chất vải </p><i style="display: inline-block" class="fas fa-angle-down"
                                                              onclick="toggleView('view_anh6')"></i></span>
                </h5>
                <div id="view_anh6" style="display:block">
                    <div class="bg-light p-4 mb-30">
                        <c:forEach items="${listChatVai}" var="list" varStatus="status">
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between">
                                <input type="radio" class="control-input" id="cv-${status.index == 0 ? '0' : ''}"
                                       name="idChatVai" value="${list.id}">
                                <label style="width: 200px; padding-top: 8px"
                                       for="cv-${status.index == 0 ? '0' : ''}">${list.ten}</label>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <h5 class="section-title position-relative text-uppercase mb-3"><span
                        class="bg-secondary pr-3"><p style="display: inline-block;width: 100px">Màu sắc </p><i style="display: inline-block" class="fas fa-angle-down"
                                                             onclick="toggleView('view_anh7')"></i></span>
                </h5>
                <div id="view_anh7" style="display:block">
                    <div class="bg-light p-4 mb-30">
                        <c:forEach items="${listMauSac}" var="list" varStatus="status">
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between">
                                <input type="checkbox" class="control-input" id="cv-${status.index == 0 ? '0' : ''}"
                                       name="mauSacIds" value="${list.id}">
                                <label style="width: 200px; padding-top: 8px"
                                       for="cv-${status.index == 0 ? '0' : ''}">${list.ten}</label>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <button class="btn btn-block btn-primary font-weight-bold my-3 py-3"
                        formaction="/user/tim_kiem_nang_cao/${idKh}">Lọc
                </button>

            </form>
            <!-- Size End -->
        </div>
        <!-- Shop Sidebar End -->


        <!-- Shop Product Start -->
        <div class="col-lg-9 col-md-8">
            <div class="row pb-3" id="product-list">
                <div class="col-12 pb-1">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <div>
                        </div>
                    </div>
                </div>
                <c:forEach items="${items}" var="list">
                    <div class="col-lg-4 col-md-6 col-sm-6 pb-1">
                        <div class="product-item bg-light mb-4">
                            <div class="product-img position-relative overflow-hidden">
                                <img class="img-fluid" style="width: 100%; height: 350px"
                                     src="/images/${list.ao.anhs.get(0).ten_url}" alt="">
                                <div class="product-action">
                                    <a class="btn btn-outline-dark btn-square" href=""><i
                                            class="fa fa-shopping-cart"></i></a>
                                    <a class="btn btn-outline-dark btn-square"
                                       href="/user/san_pham_detail/${idKh}/${list.ao.id}"><i
                                            class="fa fa-search"></i></a>
                                </div>
                            </div>
                            <div class="text-center py-4">
                                <a class="h6 text-decoration-none text-truncate"
                                   href="/user/san_pham_detail/${idKh}/${list.ao.id}">${list.ao.ten}</a>
                                <c:choose>
                                    <c:when test="${list.giaBan == list.ao.giaBan}">
                                        <div class="d-flex align-items-center justify-content-center mt-2">
                                            <h5 style="color: red;"><fmt:formatNumber value="${list.ao.giaBan}" type="currency"
                                                                                      currencySymbol="VNĐ"/></h5>
                                        </div>
                                        <p>Sản phẩm đã bán ${list.slBan}</p>
                                    </c:when>
                                    <c:when test="${list.giaBan < list.ao.giaBan}">
                                        <div class="d-flex align-items-center justify-content-center mt-2">
                                            <h6 class="text-muted ml-2">
                                                <del><fmt:formatNumber value="${list.ao.giaBan}" type="currency"
                                                                       currencySymbol="VNĐ"/></del>
                                            </h6>
                                            <h5 style="color: red;"><fmt:formatNumber value="${list.giaBan}"
                                                                                      type="currency"
                                                                                      currencySymbol="VNĐ"/></h5>
                                        </div>
                                        <p>Sản phẩm đã bán ${list.slBan}</p>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <div class="col-12">
                    <nav>
                        <ul class="pagination justify-content-center">
                            <div id="pagination">
                                <button onclick="previousPage()"
                                        style="width: 80px; background: #818182; border-radius: 15px;color: white">Pre
                                </button>
                                <span id="currentPage">1</span>
                                <button onclick="nextPage()"
                                        style="width: 80px; background: #818182; border-radius: 15px;color: white">Next
                                </button>
                            </div>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Shop Product End -->
    </div>
</div>
<!-- Shop End -->


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
    // Danh sách sản phẩm
    const productList = document.getElementById("product-list");

    // Các nút phân trang
    const previousButton = document.querySelector("#pagination button:nth-child(1)");
    const nextButton = document.querySelector("#pagination button:nth-child(3)");
    const currentPageSpan = document.getElementById("currentPage");

    // Số sản phẩm trên mỗi trang
    const itemsPerPage = 6;

    // Danh sách sản phẩm đầy đủ
    const allProducts = productList.querySelectorAll(".col-lg-4");

    // Trang hiện tại
    let currentPage = 1;

    // Hàm hiển thị sản phẩm cho trang hiện tại
    function displayCurrentPage() {
        const startIndex = (currentPage - 1) * itemsPerPage;
        const endIndex = startIndex + itemsPerPage;

        // Ẩn tất cả sản phẩm
        allProducts.forEach((product) => {
            product.style.display = "none";
        });

        // Hiển thị sản phẩm trên trang hiện tại
        for (let i = startIndex; i < endIndex; i++) {
            if (allProducts[i]) {
                allProducts[i].style.display = "block";
            }
        }

        // Cập nhật số trang hiện tại
        currentPageSpan.textContent = currentPage;
    }

    // Hàm chuyển đến trang trước
    function previousPage() {
        if (currentPage > 1) {
            currentPage--;
            displayCurrentPage();
        }
    }

    // Hàm chuyển đến trang kế tiếp
    function nextPage() {
        const totalPages = Math.ceil(allProducts.length / itemsPerPage);
        if (currentPage < totalPages) {
            currentPage++;
            displayCurrentPage();
        }
    }

    // Hiển thị trang đầu tiên khi tải trang
    displayCurrentPage();
</script>
<script>
    function toggleView(elementId) {
        var element = document.getElementById(elementId);
        element.style.display = (element.style.display === "block") ? "none" : "block";
    }
</script>

</body>

</html>