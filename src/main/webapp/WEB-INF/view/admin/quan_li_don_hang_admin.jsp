<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | DataTables</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../../resources/plugins/fontawesome-free/css/all.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="../../../resources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../../../resources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="../../../resources/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../../resources/dist/css/adminlte.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="../../../resources/css/add_form.css">

    <style>
        #addFormContainer {
            display: none;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Màu nền với độ trong suốt */
            z-index: 9999;
            justify-content: center;
            align-items: center;
            display: flex;
        }

        #addForm {
            background-color: white; /* Màu nền của biểu mẫu */
            padding: 20px;
            border-radius: 5px; /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* Đổ bóng cho biểu mẫu */
        }

        #addForm button[type="submit"] {
            background-color: #007BFF; /* Màu nền của nút */
            color: white; /* Màu chữ trắng */
            border: none;
            cursor: pointer;
        }

        #addForm button[type="submit"]:hover {
            background-color: #0056b3; /* Màu nền khi di chuột vào */
        }

        #locTheoThoiGian {
            background: #3fc3ee;
            border-radius: 15px;
            height: 100%;
            display: flex;
            align-items: center;
            padding-left: 27%;
        }

        #locTheoThoiGian:hover{
            transition: box-shadow 0.3s ease-in-out;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }
    </style>
    <style>
        .status-container {
            display: flex;
            justify-content: space-between;
            background-color: #f5f5f5;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .status {
            width: 20%;
            height: 100px;
            background-color: gray;
            text-align: center;
            line-height: 100px;
            font-size: 22px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .arrow1,
        .arrow2,
        .arrow3 {
            width: 30px;
            height: 30px;
            margin-top: 25px;
            color: gray;
            font-size: 40px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th,
        td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }

        .status-1, .status-2, .status-3, .status-4 {
            background-color: gray;
        }

        /**/

        .button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease, color 0.3s ease, transform 0.2s ease;
        }

        /* Nút Xác nhận */
        .btn-button-xn {
            margin-left: 20px;
            background-color: #007bff;
            color: #fff;
        }

        .btn-button-xn:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        /* Nút Hủy đơn */
        .btn-button-huy {
            margin-left: 10px;
            background-color: #dc3545;
            color: #fff;
        }

        .btn-button-huy:hover {
            background-color: #c82333;
            transform: scale(1.05);
        }

        .btn-button-xnhuy {
            background-color: #dc3545;
            color: #fff;
        }

        .btn-button-xnhuy:hover {
            background-color: #c82333;
            transform: scale(1.05);
        }

        /* Nút Chi tiết */
        .btn-button-ct {
            background-color: #ccc;
            color: #333;
        }

        .btn-button-ct:hover {
            background-color: #999;
            color: #fff;
            transform: scale(1.05);
        }

    </style>
    <style>
        #addFormContainer1 {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Màu nền với độ trong suốt */
            z-index: 9999;
            justify-content: center;
            align-items: center;
            display: flex;
        }

        #addForm1 {
            padding-left: 10px;
            margin-top: 10%;
            width: 100%;
            height: 100%;
            background-color: white; /* Màu nền của biểu mẫu */
            border-radius: 5px; /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* Đổ bóng cho biểu mẫu */
        }
    </style>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="/admin/index/1" class="nav-link">Home</a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="#" class="nav-link">Contact</a>
            </li>
        </ul>

        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">
            <!-- Navbar Search -->
            <li class="nav-item">
                <a class="nav-link" data-widget="navbar-search" href="#" role="button">
                    <i class="fas fa-search"></i>
                </a>
                <div class="navbar-search-block">
                    <form class="form-inline">
                        <div class="input-group input-group-sm">
                            <input class="form-control form-control-navbar" type="search" placeholder="Search"
                                   aria-label="Search">
                            <div class="input-group-append">
                                <button class="btn btn-navbar" type="submit">
                                    <i class="fas fa-search"></i>
                                </button>
                                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </li>

            <!-- Messages Dropdown Menu -->
            <li class="nav-item dropdown">
                <a class="nav-link" data-toggle="dropdown" href="#">
                    <i class="far fa-comments"></i>
                    <span class="badge badge-danger navbar-badge">3</span>
                </a>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                    <a href="#" class="dropdown-item">
                        <!-- Message Start -->
                        <div class="media">
                            <img src="../../../dist/img/user1-128x128.jpg" alt="User Avatar"
                                 class="img-size-50 mr-3 img-circle">
                            <div class="media-body">
                                <h3 class="dropdown-item-title">
                                    Brad Diesel
                                    <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                                </h3>
                                <p class="text-sm">Call me whenever you can...</p>
                                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                            </div>
                        </div>
                        <!-- Message End -->
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <!-- Message Start -->
                        <div class="media">
                            <img src="../../../dist/img/user8-128x128.jpg" alt="User Avatar"
                                 class="img-size-50 img-circle mr-3">
                            <div class="media-body">
                                <h3 class="dropdown-item-title">
                                    John Pierce
                                    <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                                </h3>
                                <p class="text-sm">I got your message bro</p>
                                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                            </div>
                        </div>
                        <!-- Message End -->
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <!-- Message Start -->
                        <div class="media">
                            <img src="../../../dist/img/user3-128x128.jpg" alt="User Avatar"
                                 class="img-size-50 img-circle mr-3">
                            <div class="media-body">
                                <h3 class="dropdown-item-title">
                                    Nora Silvester
                                    <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                                </h3>
                                <p class="text-sm">The subject goes here</p>
                                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                            </div>
                        </div>
                        <!-- Message End -->
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
                </div>
            </li>
            <!-- Notifications Dropdown Menu -->
            <li class="nav-item dropdown">
                <a class="nav-link" data-toggle="dropdown" href="#">
                    <i class="far fa-bell"></i>
                    <span class="badge badge-warning navbar-badge">15</span>
                </a>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                    <span class="dropdown-item dropdown-header">15 Notifications</span>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="fas fa-envelope mr-2"></i> 4 new messages
                        <span class="float-right text-muted text-sm">3 mins</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="fas fa-users mr-2"></i> 8 friend requests
                        <span class="float-right text-muted text-sm">12 hours</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="fas fa-file mr-2"></i> 3 new reports
                        <span class="float-right text-muted text-sm">2 days</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                    <i class="fas fa-expand-arrows-alt"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
                    <i class="fas fa-th-large"></i>
                </a>
            </li>
        </ul>
    </nav>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->
        <a href="../../../index3.html" class="brand-link">
            <img src="../../../dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
                 style="opacity: .8">
            <span class="brand-text font-weight-light">AdminLTE 3</span>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img src="../../../dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
                </div>
                <div class="info">
                    <a href="#" class="d-block">Alexander Pierce</a>
                </div>
            </div>

            <!-- SidebarSearch Form -->
            <div class="form-inline">
                <div class="input-group" data-widget="sidebar-search">
                    <input class="form-control form-control-sidebar" type="search" placeholder="Search"
                           aria-label="Search">
                    <div class="input-group-append">
                        <button class="btn btn-sidebar">
                            <i class="fas fa-search fa-fw"></i>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                    data-accordion="false">
                    <!-- Add icons to the links using the .nav-icon class
                         with font-awesome or any other icon font library -->
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                Dashboard
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="../../../index.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Dashboard v1</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="../../../index2.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Dashboard v2</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="../../../index3.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Dashboard v3</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="../widgets.html" class="nav-link">
                            <i class="nav-icon fas fa-th"></i>
                            <p>
                                Widgets
                                <span class="right badge badge-danger">New</span>
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link ">
                            <i class="nav-icon fas fa-table"></i>
                            <p>
                                Tables
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/admin/ao/view/1" class="nav-link ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Áo</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/hang/view/1" class="nav-link ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Hãng</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/loai_ao/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Loại áo</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/chat_vai/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Chất vải</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/form/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Form áo</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/huong_dan_bao_quan/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Hướng dẫn bảo quản</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/mau_sac/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Màu sắc</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/size/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Size</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-plus-square"></i>
                            <p>
                                Chương trình giảm giá
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/admin/chuong_trinh_giam_gia/add_view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Add chương trình</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>
                                        Giảm giá sản phẩm
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="/admin/view_chuong_trinh_giam_gia_sp/1" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Các chương trình</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="/admin/ap-dung" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Áp dụng</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>
                                        Giảm giá hóa đơn
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="/admin/view_chuong_trinh_giam_gia_hd/1" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Các chương trình</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item menu-open">
                        <a href="/admin/quan_li_don_hang/1" class="nav-link active">
                            <i class="nav-icon fas fa-money-bill-alt"></i>
                            <p>
                                Quản lí hóa đơn
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/chat" class="nav-link">
                            <i class="nav-icon fas fa-envelope"></i>
                            <p>
                                Chat hỗ trợ
                            </p>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>DataTables</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">DataTables</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="status-container">
                    <div class="status status-1" onclick="showStatus('1')"><i class="fas fa-hourglass-half"></i> Đang
                        chờ xác nhận
                    </div>
                    <div class="arrow arrow1"><i class="fas fa-arrow-right"></i></div>
                    <div class="status status-2" onclick="showStatus('2')"><i class="fas fa-truck"></i> Đang giao</div>
                    <div class="arrow arrow2"><i class="fas fa-arrow-right"></i></div>
                    <div class="status status-3" onclick="showStatus('3')"><i class="fas fa-check-circle"></i> Hoàn
                        thành
                    </div>
                    <div class="arrow arrow3"><i class="fas fa-arrow-right"></i></div>
                    <div class="status status-4" onclick="showStatus('4')"><i class="fas fa-times-circle"></i> Hủy</div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>

        <section class="content" style="margin-bottom: 20px">
            <form method="post">
                <input type="hidden" name="maDonHang" value="${hoaDon.ma}">
                <c:choose>
                    <c:when test="${trangThai == 1}">
                        <button class="button btn-button-xn" formaction="/admin/don_hang/xac_nhan">Xác nhận</button>
                        <button class="button btn-button-huy" id="addButton1" onclick="clickHuy()">Hủy đơn</button>
                        <button class="button btn-button-ct" style="margin-left: 71%;" id="addButton" onclick="clickThem()">Chi tiết</button>
                    </c:when>
                    <c:when test="${trangThai == 2}">
                        <button class="button btn-button-xn" formaction="/admin/don_hang/hoan_thanh">Hoàn thành</button>
                        <button class="button btn-button-ct" style="margin-left: 79%;" id="addButton" onclick="clickThem()">Chi tiết</button>
                    </c:when>
                    <c:when test="${trangThai == 3 || trangThai == 4}">
                        <button class="button btn-button-ct" style="margin-left: 91%;" id="addButton" onclick="clickThem()">Chi tiết</button>
                    </c:when>
                </c:choose>
            </form>
            <!-- /.container-fluid -->
        </section>

        <c:choose>
            <c:when test="${trangThai != 0}">
                <section class="content" style="background: white; margin: 15px;border-radius: 5px;box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2)">
                    <div class="container-fluid">
                        <div class="container">
                            <h3 style="text-align: left; padding-top: 10px; margin-bottom: 30px">THÔNG TIN ĐƠN HÀNG
                            </h3>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Mã: <span style="margin-left: 102px;background: gainsboro;padding: 10px;border-radius: 15px">${hoaDon.ma}</span></label>
                                </div>
                                <div class="form-group col-md-6">
                                    <label >Khách hàng: <span style="margin-left: 102px;background: #7adeee;padding: 10px;border-radius: 15px">${hoaDon.khachHang.ten}</span></label>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <c:choose>
                                        <c:when test="${trangThai == 1}">
                                            <label>Trạng thái: <span style="margin-left: 50px;background: #ff8b33;padding: 10px;border-radius: 15px">Chờ xác nhận</span></label>
                                        </c:when>
                                        <c:when test="${trangThai == 2}">
                                            <label>Trạng thái: <span style="margin-left: 50px;background: wheat;padding: 10px;border-radius: 15px">Đang giao</span></label>
                                        </c:when>
                                        <c:when test="${trangThai == 3}">
                                            <label>Trạng thái: <span style="margin-left: 50px;background: springgreen;padding: 10px;border-radius: 15px">Hoàn thành</span></label>
                                        </c:when>
                                        <c:when test="${trangThai == 4}">
                                            <label>Trạng thái: <span style="margin-left: 50px;background: red;padding: 10px;border-radius: 15px">Hủy</span></label>
                                        </c:when>
                                    </c:choose>
                                </div>
                                <div class="form-group col-md-6">
                                    <c:choose>
                                        <c:when test="${hoaDon.ngayThanhToan != hoaDon.ngayTao }">
                                            <label>Thanh toán: <span style="margin-left: 105px;background: #C594C5;padding: 10px;border-radius: 15px">Khi nhận hàng</span></label>
                                        </c:when>
                                        <c:when test="${hoaDon.ngayThanhToan == hoaDon.ngayTao }">
                                            <label>Thanh toán: <span style="margin-left: 105px;background: #abdec7;padding: 10px;border-radius: 15px">VnPay</span></label>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>
            </c:when>
        </c:choose>


        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <form method="post">
                            <div class="card">
                                <div class="card-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <div class="col-12">
                                            <div class="row">
                                                <div class="form-group col-3">
                                                    <select class="form-control" name="loai_ao_id" id="searchText2">
                                                        <option value="Chờ xác nhận">Chờ xác nhận</option>
                                                        <option value="Đang giao">Đang giao</option>
                                                        <option value="Hoàn thành">Hoàn thành</option>
                                                        <option value="Hủy">Hủy</option>
                                                    </select>
                                                </div>
                                                <div class="form-group col-3">
                                                    <label for="fromDate">Từ ngày:</label>
                                                    <input type="date" id="fromDate">
                                                </div>
                                                <div class="form-group col-3">
                                                    <label for="toDate">Đến ngày:</label>
                                                    <input type="date" id="toDate">
                                                </div>
                                                <div class="form-group col-3" onclick="filterTable()" >
                                                    <div id="locTheoThoiGian" >Lọc theo thời gian</div>
                                                </div>
                                            </div>
                                        </div>
                                        <thead>
                                        <tr>
                                            <th>Mã hóa đơn</th>
                                            <th>Số sản phẩm</th>
                                            <th>Tổng tiền</th>
                                            <th>Khách hàng</th>
                                            <th>Ngày tạo</th>
                                            <th>Trạng thái đơn</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listDonHangDTOS}" var="list">
                                            <tr>
                                                <td>${list.hoaDon.ma}</td>
                                                <td>${list.soLuong}</td>
                                                <td><fmt:formatNumber value="${list.hoaDon.tongTien}" type="currency"
                                                                      currencySymbol="VNĐ"/></td>
                                                <td>${list.hoaDon.khachHang.ten}</td>
                                                <td>
                                                    <c:set var="dateTimeString" value="${list.hoaDon.ngayTao}" />
                                                    <fmt:parseDate value="${dateTimeString}" var="parsedDate" pattern="yyyy-MM-dd'T'HH:mm:ss.SSS" />
                                                    <fmt:formatDate value="${parsedDate}" var="formattedDate" pattern="yyyy-MM-dd HH:mm:ss" />
                                                        ${formattedDate}
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${list.hoaDon.trangThai ==1}"><p
                                                                style="background: #ff8b33;border-radius: 15px;text-align: center">
                                                            Chờ xác nhận</p></c:when>
                                                        <c:when test="${list.hoaDon.trangThai ==2}"><p
                                                                style="background: wheat;border-radius: 15px;text-align: center">
                                                            Đang giao</p></c:when>
                                                        <c:when test="${list.hoaDon.trangThai ==3}"><p
                                                                style="background: springgreen;border-radius: 15px;text-align: center">
                                                            Hoàn thành</p></c:when>
                                                        <c:when test="${list.hoaDon.trangThai ==4}"><p
                                                                style="background: red;border-radius: 15px;text-align: center">
                                                            Hủy</p></c:when>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <button formaction="/admin/quan_li_don_hang/detail" name="detail"
                                                            value="${list.hoaDon.ma}"
                                                            class="btn btn-primary me-2">Detail
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>Mã hóa đơn</th>
                                            <th>Số sản phẩm</th>
                                            <th>Tổng tiền</th>
                                            <th>Khách hàng</th>
                                            <th>Ngày tạo</th>
                                            <th>Trạng thái đơn</th>
                                            <th>Action</th>
                                        </tr>
                                        </tfoot>
                                    </table>
                                    <ul class="pagination">
                                        <li class="page-item"><a class="page-link" href="#" id="prevPage"
                                                                 style="width: 100px;text-align: center">Previous</a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#" id="nextPage"
                                                                 style="width: 100px;text-align: center">Next</a></li>
                                    </ul>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </form>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>

        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<div id="addFormContainer" style="display: none;">
    <div class="container-fluid">
        <div class="container">
            <form method="post" id="addForm">
                <h3 style="text-align: center">Hóa đơn:  <strong style="font-size: 35px">${hoaDon.ma}</strong></h3>
                <div class="d-flex justify-content-between ">
                    <p style="width: 50px">Ảnh</p>
                    <p style="width: 200px">Tên sản phẩm</p>
                    <p style="width: 100px">Số lượng</p>
                    <p style="width: 100px">Tổng tiền</p>
                </div>

                <c:forEach items="${hoaDonChiTiets}" var="list">
                    <div class="d-flex justify-content-between ">
                        <p><img style="width: 50px; height: 70px; border: 1px solid #6e7881"
                                src="/images/${list.aoChiTiet.ao.anhs.get(0).ten_url}"></p>
                        <p style="width: 200px">${list.aoChiTiet.ao.ten}</p>
                        <p style="width: 100px">${list.soLuong}</p>
                        <p style="width: 100px"><fmt:formatNumber value="${list.donGia}" type="currency"
                                                                  currencySymbol="VNĐ"/></p>
                    </div>
                </c:forEach>
                <h5>Tên khách hàng : ${hoaDon.khachHang.ten}</h5>
                <h5>Sđt khách hàng : ${hoaDon.khachHang.sdt}</h5>

            </form>
        </div>
    </div>
</div>
<div id="addFormContainer1" style="display: none;">
    <div class="container-fluid">
        <div class="container">
            <form method="post" id="addForm1">
                <input type="hidden" name="maDonHang" value="${hoaDon.ma}">
                <h3 style="text-align: center"><strong style="font-size: 35px">Xác nhận hủy đơn hàng</strong></h3>
                <h5>Mã hóa đơn : <strong>${hoaDon.ma}</strong></h5>
                <div class="d-flex justify-content-between ">
                    <p style="width: 50px">Ảnh</p>
                    <p style="width: 200px">Tên sản phẩm</p>
                    <p style="width: 100px">Số lượng</p>
                    <p style="width: 100px">Tổng tiền</p>
                </div>

                <c:forEach items="${hoaDonChiTiets}" var="list">
                    <div class="d-flex justify-content-between ">
                        <p><img style="width: 50px; height: 70px; border: 1px solid #6e7881"
                                src="/images/${list.aoChiTiet.ao.anhs.get(0).ten_url}"></p>
                        <p style="width: 200px">${list.aoChiTiet.ao.ten}</p>
                        <p style="width: 100px">${list.soLuong}</p>
                        <p style="width: 100px"><fmt:formatNumber value="${list.donGia}" type="currency"
                                             currencySymbol="VNĐ"/></p>
                    </div>
                </c:forEach>
                <h5>Tên khách hàng : ${hoaDon.khachHang.ten}</h5>
                <h5>Sđt khách hàng : ${hoaDon.khachHang.sdt}</h5>
                <div style="margin-top: 10px">
                    <label style="font-size: 25px">Lí do hủy đơn hàng :</label>
                    <br>
                    <textarea style="width: 50%" name="ghiChu"></textarea>
                    <br>
                    <button class="button btn-button-xnhuy" formaction="/admin/don_hang/huy">Hủy đơn</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- jQuery -->
<script src="../../../resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../../resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="../../../resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../../resources/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../../../resources/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../../../resources/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../../../resources/plugins/jszip/jszip.min.js"></script>
<script src="../../../resources/plugins/pdfmake/pdfmake.min.js"></script>
<script src="../../../resources/plugins/pdfmake/vfs_fonts.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- AdminLTE App -->
<script src="../../../resources/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../../resources/dist/js/demo.js"></script>
<!-- Page specific script -->
<script>
    $(document).ready(function () {
        $('#searchText1').on('input', function () {
            var searchText = $(this).val().toLowerCase();
            $('#example1 tbody tr').each(function () {
                var rowText = $(this).text().toLowerCase();
                if (rowText.includes(searchText)) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        });
    });
</script>
<script>
    $(document).ready(function () {
        // Sự kiện thay đổi combobox
        $('#searchText2').on('change', function () {
            var selectedValue = $(this).val().toLowerCase();

            // Hiển thị tất cả dòng trong bảng trước
            $('#example1 tbody tr').show();

            // Kiểm tra giá trị của từng dòng và ẩn dòng không khớp
            $('#example1 tbody tr').each(function () {
                var rowText = $(this).text().toLowerCase();
                if (!rowText.includes(selectedValue)) {
                    $(this).hide();
                }
            });
        });
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var table = document.getElementById("example1");
        var rows = table.tBodies[0].rows;
        var rowsPerPage = 10; // Số hàng trên mỗi trang
        var currentPage = 0; // Trang hiện tại (0 là trang đầu tiên)

        function showPage(page) {
            // Ẩn tất cả các hàng
            for (var i = 0; i < rows.length; i++) {
                rows[i].style.display = "none";
            }

            // Hiển thị các hàng trong khoảng từ (page * rowsPerPage) đến ((page + 1) * rowsPerPage)
            for (var i = page * rowsPerPage; i < (page + 1) * rowsPerPage && i < rows.length; i++) {
                rows[i].style.display = "";
            }
        }

        function updatePagination() {
            // Cập nhật trạng thái nút Previous
            document.getElementById("prevPage").disabled = currentPage === 0;

            // Cập nhật trạng thái nút Next
            document.getElementById("nextPage").disabled = currentPage === Math.ceil(rows.length / rowsPerPage) - 1;
        }

        // Hiển thị trang đầu tiên khi trang được tải
        showPage(currentPage);

        // Cập nhật phân trang và hiển thị trang đầu tiên
        updatePagination();

        // Xử lý sự kiện nút Previous
        document.getElementById("prevPage").addEventListener("click", function () {
            if (currentPage > 0) {
                currentPage--;
                showPage(currentPage);
                updatePagination();
            }
        });

        // Xử lý sự kiện nút Next
        document.getElementById("nextPage").addEventListener("click", function () {
            if (currentPage < Math.ceil(rows.length / rowsPerPage) - 1) {
                currentPage++;
                showPage(currentPage);
                updatePagination();
            }
        });
    });
</script>
<script>

    window.onload = function () {
        showStatus('${trangThai}'); // Hiển thị trạng thái 'Đang chờ xác nhận' mặc định
    };

    function resetStatus() {
        // Đặt lại màu xám cho tất cả các ô
        document.querySelectorAll('.status').forEach(function (el) {
            el.style.backgroundColor = 'gray';
        });

        // Đặt lại màu xám cho tất cả các mũi tên
        document.querySelectorAll('.arrow').forEach(function (arrow) {
            arrow.style.color = 'gray';
        });
    }

    function showStatus(status) {
        event.preventDefault();
        resetStatus();

        if (status == 1) {
            var targetStatus = document.querySelector('.status-' + 1);
            targetStatus.style.backgroundColor = '#ff8b33';
        }
        if (status == 2) {
            var targetStatus = document.querySelector('.status-' + 1);
            targetStatus.style.backgroundColor = '#ff8b33';

            var targetStatus1 = document.querySelector('.status-' + 2);
            targetStatus1.style.backgroundColor = 'wheat';

            var arrowElements = document.querySelectorAll('.arrow1 i');
            arrowElements.forEach(function (arrow) {
                arrow.style.color = 'green';
            });
        }

        if (status == 3) {
            var targetStatus = document.querySelector('.status-' + 1);
            targetStatus.style.backgroundColor = '#ff8b33';

            var targetStatus1 = document.querySelector('.status-' + 2);
            targetStatus1.style.backgroundColor = 'wheat';

            var targetStatus2 = document.querySelector('.status-' + 3);
            targetStatus2.style.backgroundColor = 'springgreen';

            var arrowElements = document.querySelectorAll('.arrow1 i');
            arrowElements.forEach(function (arrow) {
                arrow.style.color = 'green';
            });

            var arrowElements1 = document.querySelectorAll('.arrow2 i');
            arrowElements1.forEach(function (arrow) {
                arrow.style.color = 'green';
            });
        }

        if (status == 4) {
            var targetStatus = document.querySelector('.status-' + 1);
            targetStatus.style.backgroundColor = '#ff8b33';

            var targetStatus1 = document.querySelector('.status-' + 2);
            targetStatus1.style.backgroundColor = '#ccc';

            var targetStatus2 = document.querySelector('.status-' + 3);
            targetStatus2.style.backgroundColor = '#ccc';

            var targetStatus3 = document.querySelector('.status-' + 4);
            targetStatus3.style.backgroundColor = 'red';

            var arrowElements = document.querySelectorAll('.arrow1 i');
            arrowElements.forEach(function (arrow) {
                arrow.style.color = '#ccc';
            });

            var arrowElements1 = document.querySelectorAll('.arrow2 i');
            arrowElements1.forEach(function (arrow) {
                arrow.style.color = '#ccc';
            });

            var arrowElements2 = document.querySelectorAll('.arrow3 i');
            arrowElements2.forEach(function (arrow) {
                arrow.style.color = '#ccc';
            });
        }
    }
</script>
<script>
    var addButton = document.getElementById("addButton");
    var addFormContainer = document.getElementById("addFormContainer");

    // Add an event listener to the button
    addButton.addEventListener("click", function () {
        // Toggle the visibility of the form container
        if (addFormContainer.style.display === "none" || addFormContainer.style.display === "") {
            addFormContainer.style.display = "block";
        } else {
            addFormContainer.style.display = "none";
        }
    });

    // Add an event listener to the background overlay
    addFormContainer.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer) {
            // Hide the form
            addFormContainer.style.display = "none";
        }
    });
    function clickThem() {
        event.preventDefault(); // Ngăn chặn submit form nếu có lỗi
    }
</script>
<script>
    var addButton1 = document.getElementById("addButton1");
    var addFormContainer1 = document.getElementById("addFormContainer1");

    // Add an event listener to the button
    addButton1.addEventListener("click", function () {
        // Toggle the visibility of the form container
        if (addFormContainer1.style.display === "none" || addFormContainer1.style.display === "") {
            addFormContainer1.style.display = "block";
        } else {
            addFormContainer1.style.display = "none";
        }
    });

    // Add an event listener to the background overlay
    addFormContainer1.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer1) {
            // Hide the form
            addFormContainer1.style.display = "none";
        }
    });
    function clickHuy() {
        event.preventDefault(); // Ngăn chặn submit form nếu có lỗi
    }
</script>
<script>
    function filterTable() {
        var fromDate = new Date(document.getElementById("fromDate").value);
        var toDate = new Date(document.getElementById("toDate").value);

        var table = document.getElementById("example1");
        var rows = table.getElementsByTagName("tr");

        for (var i = 1; i < rows.length; i++) {
            var cell = rows[i].getElementsByTagName("td")[4];
            var birthdayStr = cell.textContent.split('T')[0];

            var birthday = new Date(birthdayStr);

            if (!isNaN(fromDate) && !isNaN(toDate)) {
                if (birthday >= fromDate && birthday <= toDate) {
                    rows[i].style.display = "";
                } else {
                    rows[i].style.display = "none";
                }
            } else if (!isNaN(fromDate)) {
                if (birthday >= fromDate) {
                    rows[i].style.display = "";
                } else {
                    rows[i].style.display = "none";
                }
            } else if (!isNaN(toDate)) {
                if (birthday <= toDate) {
                    rows[i].style.display = "";
                } else {
                    rows[i].style.display = "none";
                }
            } else {
                rows[i].style.display = "";
            }
        }
    }
</script>
</body>
</html>
