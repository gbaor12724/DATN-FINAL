import React, { useState, useEffect } from 'react';
import '../assets/css/BinhLuanManager.css';

function BinhLuanManager() {
  const [comments, setComments] = useState([]);

  // Fetch dữ liệu bình luận khi component được render
  useEffect(() => {
    fetch('http://localhost:3000/api/binh-luan')
      .then((response) => response.json())
      .then((data) => setComments(data))
      .catch((error) => console.error('Lỗi khi lấy dữ liệu bình luận: ', error));
  }, []);

  // Hàm xóa bình luận
  const handleDeleteComment = (maBinhLuan) => {
    fetch(`http://localhost:3000/api/binh-luan/${maBinhLuan}`, {
      method: 'DELETE',
    })
      .then((response) => response.json())
      .then(() => {
        // Cập nhật lại danh sách bình luận sau khi xóa
        setComments((prevComments) =>
          prevComments.filter((comment) => comment.ma_binh_luan !== maBinhLuan)
        );
      })
      .catch((error) => console.error('Lỗi khi xóa bình luận: ', error));
  };

  return (
    <div>
      <h2>Quản lý bình luận</h2>
      <table>
        <thead>
          <tr>
            <th>ID Bình luận</th>
            <th>ID Sản phẩm</th>
            <th>ID Người dùng</th>
            <th>Nội dung</th>
            <th>Ngày tạo</th>
            <th>Thao tác</th>
          </tr>
        </thead>
        <tbody>
          {comments.map((comment) => (
            <tr key={comment.ma_binh_luan}>
              <td>{comment.ma_binh_luan}</td>
              <td>{comment.ma_san_pham}</td>
              <td>{comment.ma_nguoi_dung}</td>
              <td>{comment.noi_dung}</td>
              <td>{comment.ngay_tao}</td>
              <td>
                <button onClick={() => handleDeleteComment(comment.ma_binh_luan)}>
                  Xóa
                </button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default BinhLuanManager;
