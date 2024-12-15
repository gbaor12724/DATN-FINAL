import React, { useEffect, useState } from 'react';
import axios from 'axios';
import '../assets/css/ThuongHieuManager.css';

const ThuongHieuManager = () => {
  const [thuongHieuList, setThuongHieuList] = useState([]);
  const [form, setForm] = useState({ ten_thuong_hieu: '', quoc_gia: '', mo_ta: '' });
  const [isEditing, setIsEditing] = useState(false);
  const [editingId, setEditingId] = useState(null);
  const [viewMode, setViewMode] = useState('list');
  const [currentPage, setCurrentPage] = useState(1);
  const [brandsPerPage] = useState(5);

  useEffect(() => {
    fetchThuongHieu();
  }, []);

  const fetchThuongHieu = async () => {
    try {
      const response = await axios.get('http://localhost:3000/api/thuonghieu');
      setThuongHieuList(response.data);
    } catch (error) {
      console.error('Lỗi khi lấy danh sách thương hiệu:', error);
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      if (isEditing) {
        await axios.put(`http://localhost:3000/api/thuonghieu/${editingId}`, form);
        alert('Cập nhật thành công!');
      } else {
        await axios.post('http://localhost:3000/api/thuonghieu', form);
        alert('Thêm mới thành công!');
      }
      setForm({ ten_thuong_hieu: '', quoc_gia: '', mo_ta: '' });
      setIsEditing(false);
      setEditingId(null);
      setViewMode('list');
      fetchThuongHieu();
    } catch (error) {
      console.error('Lỗi khi thêm hoặc sửa thương hiệu:', error);
    }
  };

  const handleDelete = async (id) => {
    try {
      await axios.delete(`http://localhost:3000/api/thuonghieu/${id}`);
      alert('Xóa thành công!');
      fetchThuongHieu();
    } catch (error) {
      console.error('Lỗi khi xóa thương hiệu:', error);
    }
  };

  const handleEdit = (thuongHieu) => {
    setForm(thuongHieu);
    setIsEditing(true);
    setEditingId(thuongHieu.ma_thuong_hieu);
    setViewMode('add');
  };

  // Phân trang
  const indexOfLastBrand = currentPage * brandsPerPage;
  const indexOfFirstBrand = indexOfLastBrand - brandsPerPage;
  const currentBrands = thuongHieuList.slice(indexOfFirstBrand, indexOfLastBrand);

  const totalPages = Math.ceil(thuongHieuList.length / brandsPerPage);

  const paginate = (pageNumber) => setCurrentPage(pageNumber);

  return (
    <div>
      <h1>Quản Lý Thương Hiệu</h1>
      <div>
        {viewMode === 'list' ? (
          <>
            <button onClick={() => setViewMode('add')}>Thêm thương hiệu</button>
            <table border="1">
              <thead>
                <tr>
                  <th>Mã</th>
                  <th>Tên</th>
                  <th>Quốc gia</th>
                  <th>Mô tả</th>
                  <th>Hành động</th>
                </tr>
              </thead>
              <tbody>
                {currentBrands.map((thuongHieu) => (
                  <tr key={thuongHieu.ma_thuong_hieu}>
                    <td>{thuongHieu.ma_thuong_hieu}</td>
                    <td>{thuongHieu.ten_thuong_hieu}</td>
                    <td>{thuongHieu.quoc_gia || 'N/A'}</td>
                    <td>{thuongHieu.mo_ta || 'N/A'}</td>
                    <td>
                      <button onClick={() => handleEdit(thuongHieu)}>Sửa</button>
                      <button onClick={() => handleDelete(thuongHieu.ma_thuong_hieu)}>Xóa</button>
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
          </>
        ) : (
          <>
            <button onClick={() => setViewMode('list')}>Xem danh sách thương hiệu</button>
            <form onSubmit={handleSubmit}>
              <input
                type="text"
                placeholder="Tên thương hiệu"
                value={form.ten_thuong_hieu}
                onChange={(e) => setForm({ ...form, ten_thuong_hieu: e.target.value })}
                required
              />
              <input
                type="text"
                placeholder="Quốc gia"
                value={form.quoc_gia}
                onChange={(e) => setForm({ ...form, quoc_gia: e.target.value })}
              />
              <textarea
                placeholder="Mô tả"
                value={form.mo_ta}
                onChange={(e) => setForm({ ...form, mo_ta: e.target.value })}
              ></textarea>
              <button type="submit">{isEditing ? 'Cập nhật' : 'Thêm mới'}</button>
            </form>
          </>
        )}
      </div>
    </div>
  );
};

export default ThuongHieuManager;
