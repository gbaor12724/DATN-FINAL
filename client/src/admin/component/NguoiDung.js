import React, { useEffect, useState } from 'react';
import axios from 'axios';
import '../assets/css/NguoiDung.css'; // Đảm bảo đã tạo và import file CSS

const NguoiDungManager = () => {
  const [nguoiDungList, setNguoiDungList] = useState([]);
  const [form, setForm] = useState({ ten_nguoi_dung: '', email: '', vai_tro: '' });
  const [isEditing, setIsEditing] = useState(false);
  const [editingId, setEditingId] = useState(null);
  const [alert, setAlert] = useState(null); // New state for alert messages
  const [viewMode, setViewMode] = useState('list'); // State to toggle between view modes

  // Pagination states
  const [currentPage, setCurrentPage] = useState(1);
  const recordsPerPage = 5; // Số lượng bản ghi trên mỗi trang

  // Lấy danh sách người dùng
  useEffect(() => {
    if (viewMode === 'list') {
      fetchNguoiDung();
    }
  }, [viewMode]);

  const fetchNguoiDung = async () => {
    try {
      const response = await axios.get('http://localhost:3000/api/nguoi-dung');
      setNguoiDungList(response.data);
    } catch (error) {
      console.error('Lỗi khi lấy danh sách người dùng:', error);
      setAlert({ message: 'Lỗi khi tải dữ liệu người dùng', type: 'error' });
    }
  };

  // Thêm hoặc sửa người dùng
  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      if (isEditing) {
        await axios.put(`http://localhost:3000/api/nguoi-dung/${editingId}`, form);
        setAlert({ message: 'Cập nhật thành công!', type: 'success' });
      } else {
        await axios.post('http://localhost:3000/api/nguoi-dung', form);
        setAlert({ message: 'Thêm mới thành công!', type: 'success' });
      }
      setForm({ ten_nguoi_dung: '', email: '', vai_tro: '' });
      setIsEditing(false);
      setEditingId(null);
      setViewMode('list'); // Sau khi thêm/sửa xong sẽ quay lại chế độ xem danh sách
    } catch (error) {
      console.error('Lỗi khi thêm hoặc sửa người dùng:', error);
      setAlert({ message: 'Lỗi khi thêm hoặc sửa người dùng', type: 'error' });
    }
  };

  // Xóa người dùng
  const handleDelete = async (id) => {
    try {
      await axios.delete(`http://localhost:3000/api/nguoi-dung/${id}`);
      setAlert({ message: 'Xóa thành công!', type: 'success' });
      fetchNguoiDung();
    } catch (error) {
      console.error('Lỗi khi xóa người dùng:', error);
      setAlert({ message: 'Lỗi khi xóa người dùng', type: 'error' });
    }
  };

  // Điền thông tin để sửa
  const handleEdit = (nguoiDung) => {
    setForm(nguoiDung);
    setIsEditing(true);
    setEditingId(nguoiDung.ma_nguoi_dung);
    setViewMode('form'); // Chuyển sang chế độ sửa người dùng
  };

  // Pagination calculations
  const indexOfLastRecord = currentPage * recordsPerPage;
  const indexOfFirstRecord = indexOfLastRecord - recordsPerPage;
  const currentRecords = nguoiDungList.slice(indexOfFirstRecord, indexOfLastRecord);
  const totalPages = Math.ceil(nguoiDungList.length / recordsPerPage);

  const handlePageChange = (pageNumber) => {
    setCurrentPage(pageNumber);
  };

  return (
    <div>
      <h1>Quản Lý Người Dùng</h1>

      {alert && (
        <div className={`alert alert-${alert.type}`}>
          {alert.message}
        </div>
      )}

      <div>
        <button onClick={() => setViewMode('form')}>Thêm người dùng</button>
      </div>

      {/* Hiển thị form thêm người dùng hoặc danh sách người dùng tùy theo chế độ */}
      {viewMode === 'form' ? (
        <form onSubmit={handleSubmit}>
          <input
            type="text"
            placeholder="Tên người dùng"
            value={form.ten_nguoi_dung}
            onChange={(e) => setForm({ ...form, ten_nguoi_dung: e.target.value })}
            required
          />
          <input
            type="email"
            placeholder="Email"
            value={form.email}
            onChange={(e) => setForm({ ...form, email: e.target.value })}
            required
          />
          <input
            type="text"
            placeholder="Vai trò"
            value={form.vai_tro}
            onChange={(e) => setForm({ ...form, vai_tro: e.target.value })}
          />
          <button type="submit">{isEditing ? 'Cập nhật' : 'Thêm mới'}</button>
        </form>
      ) : (
        <>
          <table>
            <thead>
              <tr>
                <th>Mã</th>
                <th>Tên người dùng</th>
                <th>Email</th>
                <th>Vai trò</th>
                <th>Hành động</th>
              </tr>
            </thead>
            <tbody>
              {currentRecords.map((nguoiDung) => (
                <tr key={nguoiDung.ma_nguoi_dung}>
                  <td>{nguoiDung.ma_nguoi_dung}</td>
                  <td>{nguoiDung.ten_nguoi_dung}</td>
                  <td>{nguoiDung.email}</td>
                  <td>{nguoiDung.vai_tro}</td>
                  <td>
                    <button onClick={() => handleEdit(nguoiDung)}>Sửa</button>
                    <button onClick={() => handleDelete(nguoiDung.ma_nguoi_dung)}>Xóa</button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>

          <div className="pagination">
            {[...Array(totalPages)].map((_, index) => (
              <button
                key={index}
                onClick={() => handlePageChange(index + 1)}
                className={index + 1 === currentPage ? 'active' : ''}
              >
                {index + 1}
              </button>
            ))}
          </div>
        </>
      )}
    </div>
  );
};

export default NguoiDungManager;
