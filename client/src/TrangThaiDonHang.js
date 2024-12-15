import React, { useEffect, useState } from "react";
import axios from "axios";
import './asests/css/user.css';  // Ensure the path is correct

function TrangThaiDonHang() {
  const [user, setUser] = useState(null);
  const [orders, setOrders] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    const storedUser = localStorage.getItem("user");
    if (storedUser) {
      try {
        const parsedUser = JSON.parse(storedUser);
        fetchNguoiDung(parsedUser.id); // Fetch user info
        fetchDonHang(parsedUser.email); // Fetch orders based on email
      } catch (e) {
        setError("Lỗi khi đọc thông tin người dùng.");
        localStorage.removeItem("user");
      }
    } else {
      window.location.href = "/login";  // Redirect to login page if not logged in
    }
  }, []);

  const fetchNguoiDung = async (userId) => {
    try {
      const response = await axios.get(`http://localhost:3000/api/nguoi-dung/${userId}`);
      setUser(response.data);
    } catch (err) {
      setError("Lỗi khi lấy thông tin người dùng.");
    }
  };

  const fetchDonHang = async (email) => {
    try {
      const response = await axios.get(`http://localhost:3000/api/orders`);
      // Filter out orders with the status "Hủy"
      const filteredOrders = response.data.filter(order => order.email === email && order.trangthai !== "Hủy");
      setOrders(filteredOrders);
    } catch (err) {
      setError("Lỗi khi tải danh sách đơn hàng.");
    }
  };

  if (error) {
    return <p>{error}</p>;
  }

  if (!user) {
    return <p>Đang tải thông tin...</p>;
  }

  return (
    <div className="order-status-container">
      <h1>Trạng Thái Đơn Hàng</h1>
      {orders.length > 0 ? (
        <table>
          <thead>
            <tr>
              <th>Mã Đơn Hàng</th>
              <th>Trạng Thái</th>
              <th>Sản Phẩm</th>
              <th>Số Lượng</th>
            </tr>
          </thead>
          <tbody>
            {orders.map((order) => (
              <tr key={order.id}>
                <td>{order.id}</td>
                <td>{order.trangthai === "Đang giao hàng" ? "Đã giao hàng" : order.trangthai}</td>
                <td>
                  {order.checkoutCart.map((product, index) => (
                    <div key={product.id || index} style={{ display: 'flex', alignItems: 'center', marginBottom: '10px' }}>
                      <img 
                        src={product.hinh} 
                        alt={product.ten_san_pham} 
                        style={{ width: '50px', height: '50px', objectFit: 'cover', marginRight: '10px' }} 
                      />
                      <span>{product.ten_san_pham}</span>
                    </div>
                  ))}
                </td>
                <td>
                  {order.checkoutCart.map((product, index) => (
                    <div key={product.id || index} style={{ marginBottom: '10px' }}>
                      <span>{product.so_luong}</span>
                    </div>
                  ))}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      ) : (
        <p>Bạn chưa có đơn hàng nào.</p>
      )}
    </div>
  );
}

export default TrangThaiDonHang;
