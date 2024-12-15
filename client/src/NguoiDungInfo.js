import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import "./asests/css/user.css"; // Ensure correct path
import ChangePassword from './ChangePassword';

function NguoiDungInfo() {
  const [user, setUser] = useState(null);
  const [error, setError] = useState(null);
  const [selectedFile, setSelectedFile] = useState(null);
  const [preview, setPreview] = useState(null); // Temporary image preview URL
  const [isEditing, setIsEditing] = useState(false); // Editing state
  const [formData, setFormData] = useState({
    ten_nguoi_dung: "",
    so_dien_thoai: "",
    dia_chi: "",
  });
  const [showPasswordChange, setShowPasswordChange] = useState(false);
  const navigate = useNavigate();

  useEffect(() => {
    const storedUser = localStorage.getItem("user");
    if (storedUser) {
      try {
        const parsedUser = JSON.parse(storedUser);
        fetchNguoiDung(parsedUser.id); // Fetch user data from API
      } catch (e) {
        setError("Lỗi khi đọc thông tin người dùng.");
        localStorage.removeItem("user");
      }
    } else {
      navigate("/login");
    }
  }, [navigate]);

  const fetchNguoiDung = async (userId) => {
    try {
      const response = await axios.get(`http://localhost:3000/api/nguoi-dung/${userId}`);
      setUser(response.data);
      setFormData({
        ten_nguoi_dung: response.data.ten_nguoi_dung,
        so_dien_thoai: response.data.so_dien_thoai,
        dia_chi: response.data.dia_chi,
      });
    } catch (err) {
      setError("Lỗi khi lấy thông tin người dùng.");
    }
  };

  const handleFileChange = (event) => {
    const file = event.target.files[0];
    setSelectedFile(file);
    if (file) {
      const previewURL = URL.createObjectURL(file);
      setPreview(previewURL);
    }
  };

  const handleUpload = async () => {
    if (!selectedFile || !user) return;

    const formData = new FormData();
    formData.append("avatar", selectedFile);
    formData.append("userId", user.ma_nguoi_dung); // Use ma_nguoi_dung instead of id

    try {
      const response = await axios.post("http://localhost:3000/upload-avatar", formData, {
        headers: { "Content-Type": "multipart/form-data" },
      });
      const updatedUser = { ...user, hinh: response.data.avatarPath }; // Assuming response contains image path
      setUser(updatedUser); // Update user with new avatar
      setPreview(null); // Reset preview
    } catch (err) {
      setError("Lỗi khi tải lên và lưu ảnh.");
    }
  };

  const handleEditChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleSaveChanges = async () => {
    if (!user) return;

    try {
      const response = await axios.put(
        `http://localhost:3000/api/nguoi-dung/${user.ma_nguoi_dung}`, // Correct API endpoint
        formData
      );
      setUser(response.data);
      setIsEditing(false);
    } catch (err) {
      setError("Lỗi khi cập nhật thông tin người dùng.");
    }
  };

  if (error) {
    return <p>{error}</p>;
  }

  if (!user) {
    return <p>Đang tải thông tin...</p>;
  }

  return (
    <div className="account-container">
      <div className="sidebar">
        <div className="sidebar-header">
          <p>Xin chào, <strong>{user.ten_nguoi_dung || "Khách"}</strong></p>
        </div>
        {preview ? (
          <div className="avatar-container">
            <img 
              src={preview} 
              alt="Preview Avatar" 
              className="avatar"
            />
          </div>
        ) : (
          user.hinh && (
            <div className="avatar-container">
              <img 
                src={`http://localhost:3000${user.hinh}`} 
                alt="Avatar" 
                className="avatar"
                onError={(e) => {
                  e.target.src = '/default-avatar.png'; // Thêm ảnh mặc định khi lỗi
                }}
              />
            </div>
          )
        )}
        <div className="upload-avatar">
          <input type="file" onChange={handleFileChange} />
          <button onClick={handleUpload}>Tải lên</button>
        </div>
        <div className="sidebar-item">
          <p><a href="#" onClick={(e) => {
            e.preventDefault();
            setShowPasswordChange(!showPasswordChange);
          }}>Thay đổi mật khẩu</a></p>
        </div>
        <div className="sidebar-item">
          <p><a href="/trang-thai-don-hang">Trạng Thái Đơn Hàng</a></p>
        </div>
        <div className="sidebar-item">
          <p><a href="/logout" onClick={() => localStorage.removeItem("user")}>Đăng Xuất</a></p>
        </div>
      </div>

      <div className="main-content">
        {showPasswordChange ? (
          <ChangePassword />
        ) : (
          <>
            <h1>Thông Tin Người Dùng</h1>
            <div className="nguoi-dung-info">
              <p><strong>Tên:</strong> {isEditing ? (
                <input
                  type="text"
                  name="ten_nguoi_dung"
                  value={formData.ten_nguoi_dung}
                  onChange={handleEditChange}
                />
              ) : (
                user.ten_nguoi_dung
              )}</p>
              <p><strong>Email:</strong> {user.email}</p>
              <p><strong>Số điện thoại:</strong> {isEditing ? (
                <input
                  type="text"
                  name="so_dien_thoai"
                  value={formData.so_dien_thoai}
                  onChange={handleEditChange}
                />
              ) : (
                user.so_dien_thoai
              )}</p>
              <p><strong>Địa chỉ:</strong> {isEditing ? (
                <input
                  type="text"
                  name="dia_chi"
                  value={formData.dia_chi}
                  onChange={handleEditChange}
                />
              ) : (
                user.dia_chi
              )}</p>
              <p><strong>Vai trò:</strong> {user.vai_tro}</p>
          
            </div>
          </>
        )}
      </div>
    </div>
  );
}

export default NguoiDungInfo;
