// // History.js
// import React, { useEffect, useState } from 'react';

// const History = ({ email }) => {
//   const [orders, setOrders] = useState([]);
//   const [loading, setLoading] = useState(true);

//   useEffect(() => {
//     const fetchOrders = async () => {
//       try {
//         const response = await fetch(`http://localhost:3000/api/orders/${email}`);
//         const data = await response.json();
//         setOrders(data);
//         setLoading(false);
//       } catch (error) {
//         console.error('Error fetching orders:', error);
//         setLoading(false);
//       }
//     };

//     fetchOrders();
//   }, [email]);

//   if (loading) {
//     return <p>Loading...</p>;
//   }

//   return (
//     <div>
//       <h2>Lịch sử mua hàng</h2>
//       {orders.length > 0 ? (
//         orders.map((order) => (
//           <div key={order.id} style={{ marginBottom: '20px' }}>
//             <h3>Đơn hàng #{order.id}</h3>
//             <p>Trạng thái: {order.trangthai}</p>
//             <p>Địa chỉ: {order.address}</p>
//             <p>Phương thức thanh toán: {order.paymentMethod}</p>
//             <p>Ngày đặt hàng: {new Date(order.orderDate).toLocaleDateString()}</p>
//             <h4>Sản phẩm đã mua:</h4>
//             {order.checkoutCart ? (
//               <ul>
//                 {JSON.parse(order.checkoutCart).map((item, index) => (
//                   <li key={index}>
//                     <img src={item.hinh} alt={item.ten_san_pham} width="100" />
//                     <p>{item.ten_san_pham}</p>
//                     <p>Giá: {item.Gia}</p>
//                     <p>Số lượng: {item.so_luong}</p>
//                   </li>
//                 ))}
//               </ul>
//             ) : (
//               <p>Không có sản phẩm nào.</p>
//             )}
//           </div>
//         ))
//       ) : (
//         <p>Không có đơn hàng nào.</p>
//       )}
//     </div>
//   );
// };

// export default History;
