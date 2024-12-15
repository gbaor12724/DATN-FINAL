import React, { useEffect, useState } from "react";
import { useLocation, useNavigate } from "react-router-dom";
import Product from "./product";
import AddProduct from "./AddProduct";
import ThuongHieuManager from "./ThuongHieuManager";
import OrderManagement from "./OrderManagement";
import Dashboad from "./Dashboad";
import NguoiDungManager from "./NguoiDung";
import { FaTachometerAlt, FaUsers, FaBoxOpen, FaTrademark, FaClipboardList } from 'react-icons/fa'; // Import các biểu tượng từ react-icons
import"../assets/css/LayoutADMIN.css";
import logo from "../assets/images/logo.png";
import BinhLuanManager from "./BinhLuanManager";
export default function LayoutADMIN() {
  const navigate = useNavigate();
  const [AuthLogin, setAuthLogin] = useState('');

  useEffect(() => {
    const cookie = JSON.parse(localStorage.getItem('user'));
    if (cookie && cookie.vaitro !== AuthLogin) {
      setAuthLogin(cookie.vaitro);
      console.log(cookie.vaitro)
    }
    if(AuthLogin == 'user'){
      window.location.href ="/"
      console.log('bbbbb')
    }
    else(
      console.log('aaaaa')
    )

  }, [AuthLogin]);
  
  const styles = {
    logo: {
      width: "120px",
      borderRadius: "8px",
    },
    container: {
      display: "flex",
      minHeight: "100vh",
      backgroundColor: "#f9f9f9",
    },
    sidebar: {
      width: "250px",
      backgroundColor: "#ffffff",
      color: "#2c3e50",
      padding: "20px",
      fontFamily: "Arial, sans-serif",
      boxShadow: "2px 0 5px rgba(0, 0, 0, 0.1)",
      transition: "background-color 0.3s ease",
    },
    logoContainer: {
      textAlign: "center",
      marginBottom: "20px",
    },
    sidebarItem: {
      margin: "15px 0",
      color: "#2c3e50",
      textDecoration: "none",
      fontSize: "18px",
      display: "block",
      padding: "10px",
      borderRadius: "5px",
      transition: "background-color 0.3s, color 0.3s",
    },
    sidebarItemHover: {
      backgroundColor: "#f1f1f1",
      color: "#1abc9c",
    },
    mainContent: {
      flex: 1,
      padding: "20px",
      backgroundColor: "#f9f9f9",
    },
    header: {
      display: "flex",
      justifyContent: "space-between",
      alignItems: "center",
      backgroundColor: "#ffffff",
      padding: "10px 20px",
      color: "#000000",
      fontFamily: "Arial, sans-serif",
      position: "sticky",
      top: 0,
      zIndex: 1000,
      boxShadow: "0 2px 5px rgba(0, 0, 0, 0.1)",
    },
    logoutButton: {
      backgroundColor: "#e74c3c",
      border: "none",
      color: "#ecf0f1",
      padding: "10px 15px",
      borderRadius: "5px",
      fontSize: "14px",
      cursor: "pointer",
      transition: "background-color 0.3s ease",
    },
    logoutButtonHover: {
      backgroundColor: "#c0392b",
    },
  };

  const location = useLocation();

  const handleLogout = () => {
    localStorage.removeItem("adminToken");
    sessionStorage.clear();
    navigate("/");
  };

  const renderContent = () => {
    switch (location.pathname) {
      case "/dashboard":
        return <Dashboad />;
      case "/product":
        return <Product />;
      case "/product/add":
        return <AddProduct />;
      case "/thuonghieu":
        return <ThuongHieuManager />;
      case "/nguoi-dung":
        return <NguoiDungManager />;
      case "/orders":
        return <OrderManagement />;
        case "/binh-luan":
          return <BinhLuanManager />;
      default:
        return <h2>Dashboard - Thống kê</h2>;
    }
  };

  return (
    <div style={styles.container}>
      {/* Sidebar Left */}
      <aside style={styles.sidebar}>
        {/* Logo */}
        <div style={styles.logoContainer}>
          <img src={logo} alt="Logo" style={styles.logo} />
        </div>
  
        {/* Sidebar Items */}
        <a
          href="/dashboard"
          style={styles.sidebarItem}
          onMouseOver={(e) =>
            (e.target.style.color = styles.sidebarItemHover.color)
          }
          onMouseOut={(e) =>
            (e.target.style.color = styles.sidebarItem.color)
          }
        >
          <div style={styles.sidebarItemContent}>
            <FaTachometerAlt style={{ marginRight: '10px' }} />
            <span style={{ fontSize: '16px', fontWeight: 'bold' }}>Tổng quan</span>
          </div>
        </a>
        <a
          href="/nguoi-dung"
          style={styles.sidebarItem}
          onMouseOver={(e) =>
            (e.target.style.color = styles.sidebarItemHover.color)
          }
          onMouseOut={(e) =>
            (e.target.style.color = styles.sidebarItem.color)
          }
        >
          <div style={styles.sidebarItemContent}>
            <FaUsers style={{ marginRight: '10px' }} />
            <span style={{ fontSize: '16px', fontWeight: 'bold' }}>quản lý người dùng</span>
          </div>
        </a>
        <a
          href="/product"
          style={styles.sidebarItem}
          onMouseOver={(e) =>
            (e.target.style.color = styles.sidebarItemHover.color)
          }
          onMouseOut={(e) =>
            (e.target.style.color = styles.sidebarItem.color)
          }
        >
          <div style={styles.sidebarItemContent}>
            <FaBoxOpen style={{ marginRight: '10px' }} />
            <span style={{ fontSize: '16px', fontWeight: 'bold' }}>quản lý sản phẩm</span>
          </div>
        </a>
        <a
          href="/thuonghieu"
          style={styles.sidebarItem}
          onMouseOver={(e) =>
            (e.target.style.color = styles.sidebarItemHover.color)
          }
          onMouseOut={(e) =>
            (e.target.style.color = styles.sidebarItem.color)
          }
        >
          <div style={styles.sidebarItemContent}>
            <FaTrademark style={{ marginRight: '10px' }} />
            <span style={{ fontSize: '16px', fontWeight: 'bold' }}>Quản lý  thương hiệu</span>
          </div>
        </a>
        <a
          href="/binh-luan"
          style={styles.sidebarItem}
          onMouseOver={(e) =>
            (e.target.style.color = styles.sidebarItemHover.color)
          }
          onMouseOut={(e) =>
            (e.target.style.color = styles.sidebarItem.color)
          }
        >
          <div style={styles.sidebarItemContent}>
            <FaTrademark style={{ marginRight: '10px' }} />
            <span style={{ fontSize: '16px', fontWeight: 'bold' }}>Quản lý bình luận</span>
          </div>
        </a>
        <a
          href="/orders"
          style={styles.sidebarItem}
          onMouseOver={(e) =>
            (e.target.style.color = styles.sidebarItemHover.color)
          }
          onMouseOut={(e) =>
            (e.target.style.color = styles.sidebarItem.color)
          }
        >
          <div style={styles.sidebarItemContent}>
            <FaClipboardList style={{ marginRight: '10px' }} />
            <span style={{ fontSize: '16px', fontWeight: 'bold' }}>Quản lý đơn hàng</span>
          </div>
        </a>
      </aside>
  
      {/* Main Content */}
      <div style={styles.mainContent}>
        <header style={styles.header}>
          <div>Xin chào ADMIN!!</div>
          {/* Nút Logout */}
          <button
            style={styles.logoutButton}
            onMouseOver={(e) =>
              (e.target.style.backgroundColor =
                styles.logoutButtonHover.backgroundColor)
            }
            onMouseOut={(e) =>
              (e.target.style.backgroundColor = styles.logoutButton.backgroundColor)
            }
            onClick={handleLogout}
          >
            Logout
          </button>
        </header>
        <main style={{ padding: "20px" }}>{renderContent()}</main>
      </div>
    </div>
  );
  
  
}
