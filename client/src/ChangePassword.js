import React, { useState } from 'react';
import axios from 'axios';
import './asests/css/ChangePassword.css';

function ChangePassword() {
  const [passwordData, setPasswordData] = useState({
    oldPassword: '',
    newPassword: '',
    confirmPassword: '',
  });
  const [message, setMessage] = useState('');
  const [error, setError] = useState('');

  const handleChange = (e) => {
    const { name, value } = e.target;
    setPasswordData(prev => ({
      ...prev,
      [name]: value
    }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setMessage('');
    setError('');

    // Validate passwords
    if (passwordData.newPassword !== passwordData.confirmPassword) {
      setError('Mật khẩu mới không khớp!');
      return;
    }

    if (passwordData.newPassword.length < 6) {
      setError('Mật khẩu mới phải có ít nhất 6 ký tự!');
      return;
    }

    try {
      // Lấy thông tin user từ localStorage
      const user = JSON.parse(localStorage.getItem('user'));
      if (!user || !user.email) {
        setError('Vui lòng đăng nhập lại!');
        return;
      }

      const response = await axios.post('http://localhost:3000/api/change-password', {
        email: user.email, // Gửi email thay vì userId
        oldPassword: passwordData.oldPassword,
        newPassword: passwordData.newPassword
      });

      if (response.data.success) {
        setMessage(response.data.message);
        // Reset form
        setPasswordData({
          oldPassword: '',
          newPassword: '',
          confirmPassword: ''
        });
      } else {
        setError(response.data.message);
      }
    } catch (err) {
      setError(err.response?.data?.message || 'Có lỗi xảy ra khi đổi mật khẩu!');
    }
  };

  return (
    <div className="change-password-container">
      <h2>Đổi Mật Khẩu</h2>
      {message && <div className="success-message">{message}</div>}
      {error && <div className="error-message">{error}</div>}
      
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label>Mật khẩu hiện tại:</label>
          <input
            type="password"
            name="oldPassword"
            value={passwordData.oldPassword}
            onChange={handleChange}
            required
          />
        </div>

        <div className="form-group">
          <label>Mật khẩu mới:</label>
          <input
            type="password"
            name="newPassword"
            value={passwordData.newPassword}
            onChange={handleChange}
            required
          />
        </div>

        <div className="form-group">
          <label>Xác nhận mật khẩu mới:</label>
          <input
            type="password"
            name="confirmPassword"
            value={passwordData.confirmPassword}
            onChange={handleChange}
            required
          />
        </div>

        <button type="submit">Đổi Mật Khẩu</button>
      </form>
    </div>
  );
}

export default ChangePassword;
