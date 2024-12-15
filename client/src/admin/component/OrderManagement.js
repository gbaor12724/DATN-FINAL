import React, { useEffect, useState } from 'react';
import '../assets/css/OrderManagement.css';

const OrderManagement = () => {
  const [orders, setOrders] = useState([]);
  const [loading, setLoading] = useState(true);
  const [currentPage, setCurrentPage] = useState(1);
  const [ordersPerPage] = useState(5); // Số lượng đơn hàng mỗi trang

  useEffect(() => {
    // Fetch dữ liệu đơn hàng từ API
    fetch('http://localhost:3000/api/orders')
      .then((response) => response.json())
      .then((data) => {
        setOrders(data);
        setLoading(false);
      })
      .catch((error) => {
        console.error('Lỗi khi tải dữ liệu đơn hàng:', error);
        setLoading(false);
      });
  }, []);

  const updateOrderStatus = (orderId, newStatus) => {
    fetch(`http://localhost:3000/api/orders/${orderId}/status`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ trangthai: newStatus }),
    })
      .then((response) => response.json())
      .then((data) => {
        alert(data.message);
        setOrders(orders.map(order => order.id === orderId ? { ...order, trangthai: newStatus } : order));
      })
      .catch((error) => {
        console.error('Lỗi khi cập nhật trạng thái đơn hàng:', error);
      });
  };

  const handleStatusChange = (orderId, event) => {
    const newStatus = event.target.value;
    updateOrderStatus(orderId, newStatus);
  };

  const indexOfLastOrder = currentPage * ordersPerPage;
  const indexOfFirstOrder = indexOfLastOrder - ordersPerPage;
  const currentOrders = orders.slice(indexOfFirstOrder, indexOfLastOrder);
  const totalPages = Math.ceil(orders.length / ordersPerPage);
  const paginate = (pageNumber) => setCurrentPage(pageNumber);
  if (loading) {
    return <div>Đang tải...</div>;
  }
  return (
    <div>
      <h1>Quản lý đơn hàng</h1>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Khách hàng</th>
            <th>Email</th>
            <th>Trạng thái</th>
            <th>Sản phẩm</th>
            <th>Hành động</th>
          </tr>
        </thead>
        <tbody>
          {currentOrders.map((order) => (
            <tr key={order.id}>
              <td>{order.id}</td>
              <td>{order.name}</td>
              <td>{order.email}</td>
              <td>{order.trangthai}</td>
              <td>
                {order.checkoutCart && order.checkoutCart.length > 0 ? (
                  order.checkoutCart.map((product, index) => (
                    <div key={index} style={{ display: 'flex', alignItems: 'center', marginBottom: '10px' }}>
                      <img
                        src={product.hinh}
                        alt={product.ten_san_pham}
                        style={{ width: '50px', height: '50px', objectFit: 'cover', marginRight: '10px' }}
                      />
                      <span>{product.ten_san_pham}</span>
                    </div>
                  ))
                ) : (
                  <p>Không có sản phẩm trong đơn hàng.</p>
                )}
              </td>
              <td>
                <select
                  value={order.trangthai}
                  onChange={(event) => handleStatusChange(order.id, event)}
                  style={{ padding: '8px', borderRadius: '5px', width: '150px', cursor: 'pointer' }}
                >
                  <option value="Đang xử lý">Đang xử lý</option>
                  <option value="Đang giao hàng">Đang giao hàng</option>
                  <option value="Giao hàng thành công">Giao hàng thành công</option>
                  <option value="Hủy">Hủy</option>
                </select>
              </td>
            </tr>
          ))}
        </tbody>
      </table>

      {/* Phân trang */}
      <div className="pagination">
        {[...Array(totalPages).keys()].map(number => (
          <button
            key={number + 1}
            onClick={() => paginate(number + 1)}
            className={currentPage === number + 1 ? 'active' : ''}
          >
            {number + 1}
          </button>
        ))}
      </div>
    </div>
  );
};

export default OrderManagement;
