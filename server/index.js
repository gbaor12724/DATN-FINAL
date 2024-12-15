const mysql = require('mysql2');
const exp = require('express');
const app = exp();
const cors = require('cors');
const emailjs = require('emailjs-com'); // Import EmailJS
require('dotenv').config();  // Đọc biến môi trường từ tệp .env
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const multer = require('multer');
const express = require('express');
const path = require('path');
const fs = require('fs');
const crypto = require('crypto');
const https = require('https');
const { default: axios } = require("axios");
app.use([cors(), exp.json()]);
app.use(express.json());
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));



// Kết nối đến cơ sở dữ liệu MySQL
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  port: 3306,
  database: 'rx_luxury'
});

db.connect(err => {
  if (err) throw err;
  console.log('Đã kết nối đến database');
});

// API để lấy sản phẩm với giới hạn
app.get('/donghonam/sanpham', (req, res) => {
  const query = 'SELECT * FROM san_pham';
  db.query(query, (err, result) => {
    if (err) {
      console.error(err);
      res.status(500).send('Lỗi truy vấn cơ sở dữ liệu');
      return;
    }
    res.json(result);
  });
});
// API để lấy danh sách bình luận
app.get('/api/binh-luan', (req, res) => {
  const query = 'SELECT * FROM binh_luan';
  db.query(query, (err, results) => {
    if (err) {
      console.error('Lỗi khi truy vấn dữ liệu: ', err);
      return res.status(500).send('Lỗi server');
    }
    res.json(results);
  });
});

app.delete('/api/binh-luan/:id', (req, res) => {
  const { id } = req.params;

  const query = 'DELETE FROM binh_luan WHERE ma_binh_luan = ?';
  
  db.query(query, [id], (err, result) => {
    if (err) {
      console.error('Lỗi khi xóa bình luận: ', err);
      return res.status(500).send('Lỗi server');
    }
    
    if (result.affectedRows > 0) {
      res.json({ message: 'Bình luận đã được xóa thành công' });
    } else {
      res.status(404).send('Bình luận không tồn tại');
    }
  });
});
// API tìm kiếm sản phẩm
app.get('/api/search', (req, res) => {
  const searchTerm = req.query.query;
  if (!searchTerm) {
    return res.status(400).send('Thiếu từ khóa tìm kiếm');
  }
  const query = 'SELECT * FROM san_pham WHERE ten_san_pham LIKE ?';
  db.query(query, [`%${searchTerm}%`], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send('Lỗi truy vấn cơ sở dữ liệu');
    }
    res.json(result);
  });
});

// API lấy chi tiết sản phẩm theo mã
app.get('/api/chitetsanpham/:ma_san_pham', (req, res) => {
  const maSanPham = req.params.ma_san_pham; // Lấy mã sản phẩm từ URL
  const query = 'SELECT * FROM san_pham WHERE ma_san_pham = ?'; // Truy vấn sản phẩm theo mã sản phẩm

  db.query(query, [maSanPham], (err, result) => {
    if (err) {
      console.error(err);
      res.status(500).send('Lỗi truy vấn cơ sở dữ liệu');
      return;
    }

    if (result.length === 0) {
      // Nếu không tìm thấy sản phẩm
      res.status(404).send('Không tìm thấy sản phẩm');
    } else {
      // Trả về dữ liệu sản phẩm
      res.json(result);
    }
  });
});

// API gửi email liên hệ
app.post('/api/contact', (req, res) => {
  const { name, email, sdt, message } = req.body;

  // Xác định các tham số cần thiết cho template
  const templateParams = {
    from_name: name,
    from_email: email,
    phone: sdt,
    message: message
  };

  // Gửi email qua EmailJS
  emailjs.send(process.env.EMAILJS_SERVICE_ID, process.env.EMAILJS_TEMPLATE_ID, templateParams, process.env.EMAILJS_USER_ID)
    .then((response) => {
      console.log('Email đã được gửi:', response.status, response.text);
      res.json({ "status": "success", "message": "Email đã được gửi thành công" });
    }, (error) => {
      console.error('Lỗi gửi email:', error);
      res.status(500).json({ "status": "error", "message": "Lỗi khi gửi email", "error": error.text });
    });
});

// Thương hiệu
app.get('/donghonam/sanpham', async (req, res) => {
  const brandId = req.query.brand;
  let query = 'SELECT * FROM san_pham';
  if (brandId) {
    query += ` WHERE ma_thuong_hieu = ${brandId}`;
  }
  db.query(query, (err, result) => {
    if (err) {
      console.error(err);
      res.status(500).send('Lỗi truy vấn cơ sở dữ liệu');
      return;
    }
    res.json(result);
  });
});

// Giỏ hàng
app.post('/luudonhang/', (req, res) => {
  let data = req.body;
  let sql = 'INSERT INTO don_hang SET ?';
  db.query(sql, data, (err, result) => {
    if (err) res.json({ "id_dh": -1, "thongbao": "Lỗi lưu đơn hàng", err })
    else {
      const id_dh = result.insertId;
      res.json({ "id_dh": id_dh, "thongbao": "Đã lưu đơn hàng" });
    }
  });
});

// Lấy chi tiết 1 sản phẩm
app.get('/sp/:id', (req, res) => {
  let id = parseInt(req.params.id || 0);
  if (isNaN(id) || id <= 0) {
    res.json({ "thongbao": "Không biết sản phẩm", "id": id });
    return;
  }
  let sql = 'SELECT ten_san_pham, mo_ta, Gia, hinh, nam_nu, gia_giam FROM san_pham WHERE id = ?';
  db.query(sql, [id], (err, data) => {
    if (err) res.json({ "thongbao": "Lỗi lấy 1 sp", err });
    else res.json(data[0]);
  });
});

// Đăng nhập
// app.post('/login', (req, res) => {
//   const { email, mat_khau } = req.body;
//   const query = 'SELECT * FROM nguoi_dung WHERE email = ? AND mat_khau = ?';

//   db.query(query, [email, mat_khau], (err, result) => {
//     if (err) {
//       return res.status(500).json({ message: 'Lỗi server' });
//     }
//     if (result.length > 0) {
//       return res.status(200).json({ message: 'Đăng nhập thành công', user: result[0] });
//     } else {
//       return res.status(401).json({ message: 'Email hoặc mật khẩu không đúng' });
//     }
//   });
// });

// API: Đăng nhập
app.post('/api/login', (req, res) => {
  const { email, mat_khau } = req.body;

  const query = 'SELECT * FROM nguoi_dung WHERE email = ?';
  db.query(query, [email], (err, results) => {
    if (err) {
      console.error('Database query error:', err);
      return res.status(500).json({ success: false, message: 'Server error. Please try again later.' });
    }
    if (results.length === 0) {
      return res.status(401).json({ success: false, message: 'Invalid email or password' });
    }

    const user = results[0];

    bcrypt.compare(mat_khau, user.mat_khau, (err, isMatch) => {
      if (err) {
        console.error('Password comparison error:', err);
        return res.status(500).json({ success: false, message: 'Server error. Please try again later.' });
      }
      if (!isMatch) {
        return res.status(401).json({ success: false, message: 'Invalid email or password' });
      }

      const token = jwt.sign(
        { id: user.ma_nguoi_dung, email: user.email },
        process.env.JWT_SECRET_KEY || 'default_secret_key', // Tốt nhất nên lưu key trong biến môi trường
        { expiresIn: '1h' }
      );

      return res.json({
        success: true,
        message: 'Login successful',
        token: token,
        user: { id: user.ma_nguoi_dung, email: user.email, name: user.ho_ten, vaitro: user.vai_tro },
      });
    });
  });
});


// API Đăng ký
app.post('/api/register', (req, res) => {
  const {
    ten_nguoi_dung,
    email,
    mat_khau,
    vai_tro = 'user',  // Vai trò mặc định là 'user'
    so_dien_thoai,
    dia_chi,
    diem_thuong = 0,  // Điểm thưởng mặc định là 0
    hinh,
    google_id
  } = req.body;

  // Kiểm tra nếu tất cả các trường bắt buộc có giá trị
  if (!ten_nguoi_dung || !email || !mat_khau || !so_dien_thoai || !dia_chi) {
    return res.status(400).json({ success: false, message: 'Vui lòng nhập đầy đủ thông tin.' });
  }

  // Kiểm tra email đã tồn tại trong cơ sở dữ liệu
  const checkEmailQuery = 'SELECT * FROM nguoi_dung WHERE email = ?';
  db.query(checkEmailQuery, [email], (err, results) => {
    if (err) {
      console.error('Email check error:', err);
      return res.status(500).json({ success: false, message: 'Lỗi kiểm tra email. Vui lòng thử lại sau.' });
    }

    // Nếu email đã tồn tại, trả về lỗi
    if (results.length > 0) {
      return res.status(400).json({ success: false, message: 'Email đã tồn tại. Vui lòng sử dụng email khác.' });
    }

    // Mã hóa mật khẩu trước khi lưu vào cơ sở dữ liệu
    bcrypt.hash(mat_khau, 10, (err, hashedPassword) => {
      if (err) {
        console.error('Password hashing error:', err);
        return res.status(500).json({ success: false, message: 'Lỗi mã hóa mật khẩu. Vui lòng thử lại sau.' });
      }

      // Câu lệnh INSERT vào cơ sở dữ liệu
      const query = `
        INSERT INTO nguoi_dung 
        (ten_nguoi_dung, email, mat_khau, vai_tro, so_dien_thoai, dia_chi, diem_thuong, ngay_tao, hinh, google_id) 
        VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), ?, ?)
      `;
      db.query(query, [ten_nguoi_dung, email, hashedPassword, vai_tro, so_dien_thoai, dia_chi, diem_thuong, hinh || null, google_id || null], (err, result) => {
        if (err) {
          console.error('Registration error:', err);
          return res.status(500).json({ success: false, message: 'Lỗi khi lưu người dùng vào cơ sở dữ liệu. Vui lòng thử lại.', err });
        }

        // Trả về phản hồi thành công
        res.status(200).json({ success: true, message: 'Đăng ký thành công! Bạn có thể đăng nhập ngay.' });
      });
    });
  });
});



app.get('/api/orders/:email', (req, res) => {
  const email = req.params.email;
  const query = `SELECT * FROM orders WHERE email = ?`;

  db.query(query, [email], (err, results) => {
    if (err) {
      res.status(500).send({ message: 'Database error' });
      return;
    }
    res.json(results);
  });
});

// Lấy tất cả đơn hàng
app.get('/api/orders', (req, res) => {
  const query = 'SELECT * FROM orders ORDER BY orderDate DESC';
  db.query(query, (err, results) => {
    if (err) {
      return res.status(500).json({ message: 'Lỗi khi lấy dữ liệu đơn hàng', error: err });
    }
    res.json(results);
  });
});

// Lấy đơn hàng theo ID
app.get('/api/orders/:id', (req, res) => {
  const orderId = req.params.id;
  const query = 'SELECT * FROM orders WHERE id = ?';
  db.query(query, [orderId], (err, results) => {
    if (err) {
      return res.status(500).json({ message: 'Lỗi khi lấy dữ liệu đơn hàng', error: err });
    }
    if (results.length === 0) {
      return res.status(404).json({ message: 'Đơn hàng không tồn tại' });
    }
    res.json(results[0]);
  });
});

// Cập nhật trạng thái đơn hàng
app.put('/api/orders/:id/status', (req, res) => {
  const orderId = req.params.id;
  const { trangthai } = req.body; // Trạng thái mới

  const query = 'UPDATE orders SET trangthai = ? WHERE id = ?';
  db.query(query, [trangthai, orderId], (err, results) => {
    if (err) {
      return res.status(500).json({ message: 'Lỗi khi cập nhật trạng thái đơn hàng', error: err });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ message: 'Đơn hàng không tồn tại' });
    }
    res.json({ message: 'Trạng thái đơn hàng đã được cập nhật thành công' });
  });
});

// Admin - lấy tất cả sản phẩm
app.get('/api/products', (req, res) => {
  const sql = 'SELECT * FROM san_pham';
  db.query(sql, (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ message: 'Có lỗi khi truy vấn dữ liệu' });
    }
    res.json(results);
  });
});


// lấy sp
app.get('/api/products/:id', (req, res) => {
  const { id } = req.params;
  const sql = 'SELECT * FROM san_pham WHERE ma_san_pham = ?';
  db.query(sql, [id], (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ message: 'Có lỗi khi truy vấn dữ liệu' });
    }
    if (results.length === 0) {
      return res.status(404).json({ message: 'Sản phẩm không tồn tại' });
    }
    res.json(results[0]);
  });
});


// Xóa sản phẩm
app.delete('/api/products/:id', (req, res) => {
  const { id } = req.params;
  const sql = 'DELETE FROM san_pham WHERE ma_san_pham = ?';

  db.query(sql, [id], (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ message: 'Có lỗi khi xóa sản phẩm' });
    }
    res.json({ message: 'Sản phẩm đã được xóa thành công' });
  });
});

//sua sp
app.put('/api/products/:id', (req, res) => {
  const productId = req.params.id;
  const { name, price, description } = req.body;
  const query = 'UPDATE san_pham SET name = ?, price = ?, description = ? WHERE id = ?';
  db.query(query, [name, price, description, productId], (err, result) => {
    if (err) {
      res.status(500).send({ error: 'Database error' });
    } else {
      res.json({ message: 'Product updated' });
    }
  });
});

// Thêm sản phẩm
app.post('/api/products', (req, res) => {
  const {
    ten_san_pham,
    Gia,
    so_luong_ton_kho,
    hinh,
    hinh2,
    ma_danh_muc,
    ma_thuong_hieu,
    ma_chat_lieu,
    kieu_may,
    kha_nang_chong_nuoc,
    duong_kinh_dong_ho,
    chat_lieu_day_deo,
    nam_nu,
    bao_hanh,
    gia_giam,
    mo_ta,
    ma_khuyen_mai,
    luot_xem
  } = req.body;

  // Kiểm tra dữ liệu đầu vào
  if (!ten_san_pham || !Gia || !so_luong_ton_kho || !hinh || !hinh2) {
    return res.status(400).json({ success: false, message: "Thiếu thông tin bắt buộc." });
  }

  // Tạo câu lệnh SQL để thêm sản phẩm vào cơ sở dữ liệu
  const query = `
    INSERT INTO san_pham (ten_san_pham, Gia, so_luong_ton_kho, hinh, hinh2, ma_danh_muc, ma_thuong_hieu, ma_chat_lieu, kieu_may, kha_nang_chong_nuoc, duong_kinh_dong_ho, chat_lieu_day_deo, nam_nu, bao_hanh, gia_giam, mo_ta, ma_khuyen_mai, luot_xem)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?)
  `;

  // Thực thi câu lệnh SQL với các tham số từ frontend
  db.query(query, [
    ten_san_pham, Gia, so_luong_ton_kho, hinh, hinh2, ma_danh_muc, ma_thuong_hieu, ma_chat_lieu,
    kieu_may, kha_nang_chong_nuoc, duong_kinh_dong_ho, chat_lieu_day_deo, nam_nu, bao_hanh, gia_giam,
    mo_ta, ma_khuyen_mai, luot_xem
  ], (err, result) => {
    if (err) {
      console.error('Lỗi khi thêm sản phẩm: ', err);
      return res.status(500).json({ success: false, message: 'Lỗi khi thêm sản phẩm.' });
    }
    res.status(200).json({ success: true, message: 'Sản phẩm đã được thêm thành công!' });
  });
});




// API để nhận đơn hàng và lưu vào MySQL
app.post('/api/orders', (req, res) => {
  const { name, email, phone, trangthai, address, city, notes, paymentMethod, agreeTerms, checkoutCart } = req.body;
  // return res.status(200).json({mesage : ""})
  if (!name || !email || checkoutCart.length === 0) {
    return res.status(400).json({ message: 'Vui lòng điền đầy đủ thông tin và chọn sản phẩm.' });
  }

  const query = `
      INSERT INTO orders (name, email, phone,trangthai, address, city, notes, paymentMethod, agreeTerms, checkoutCart)
      VALUES (?, ?, ?,?, ?, ?, ?, ?, ?, ?)
  `;

  db.query(query, [name, email, phone, trangthai, address, city, notes, paymentMethod, agreeTerms, JSON.stringify(checkoutCart)], (err, result) => {
    if (err) {
      console.error('Lỗi khi lưu đơn hàng:', err);
      return res.status(500).json({ message: 'Đã xảy ra lỗi khi lưu đơn hàng', error: err });
    }
    res.status(201).json({ message: 'Đặt hàng thành công!', orderId: result.insertId });
  });
});
// **1. Lấy danh sách thương hiệu**
app.get('/api/thuonghieu', (req, res) => {
  const query = 'SELECT * FROM thuonghieu';
  db.query(query, (err, results) => {
    if (err) return res.status(500).json({ error: 'Lỗi server' });
    res.status(200).json(results);
  });
});

// **2. Lấy thông tin một thương hiệu**
app.get('/api/thuonghieu/:id', (req, res) => {
  const { id } = req.params;
  const query = 'SELECT * FROM thuonghieu WHERE ma_thuong_hieu = ?';
  db.query(query, [id], (err, result) => {
    if (err) return res.status(500).json({ error: 'Lỗi server' });
    if (result.length === 0) return res.status(404).json({ error: 'Không tìm thấy thương hiệu' });
    res.status(200).json(result[0]);
  });
});

// **3. Thêm mới một thương hiệu**
app.post('/api/thuonghieu', (req, res) => {
  const { ten_thuong_hieu, quoc_gia, mo_ta } = req.body;
  if (!ten_thuong_hieu) return res.status(400).json({ error: 'Tên thương hiệu là bắt buộc' });

  const query = 'INSERT INTO thuonghieu (ten_thuong_hieu, quoc_gia, mo_ta) VALUES (?, ?, ?)';
  db.query(query, [ten_thuong_hieu, quoc_gia, mo_ta], (err, result) => {
    if (err) return res.status(500).json({ error: 'Lỗi server' });
    res.status(201).json({ message: 'Thêm thương hiệu thành công', ma_thuong_hieu: result.insertId });
  });
});

// **4. Sửa thông tin thương hiệu**
app.put('/api/thuonghieu/:id', (req, res) => {
  const { id } = req.params;
  const { ten_thuong_hieu, quoc_gia, mo_ta } = req.body;

  const query = 'UPDATE thuonghieu SET ten_thuong_hieu = ?, quoc_gia = ?, mo_ta = ? WHERE ma_thuong_hieu = ?';
  db.query(query, [ten_thuong_hieu, quoc_gia, mo_ta, id], (err, result) => {
    if (err) return res.status(500).json({ error: 'Lỗi server' });
    if (result.affectedRows === 0) return res.status(404).json({ error: 'Không tìm thấy thương hiệu' });
    res.status(200).json({ message: 'Cập nhật thương hiệu thành công' });
  });
});

// **5. Xóa thương hiệu**
app.delete('/api/thuonghieu/:id', (req, res) => {
  const { id } = req.params;

  const query = 'DELETE FROM thuonghieu WHERE ma_thuong_hieu = ?';
  db.query(query, [id], (err, result) => {
    if (err) return res.status(500).json({ error: 'Lỗi server' });
    if (result.affectedRows === 0) return res.status(404).json({ error: 'Không tìm thấy thương hiệu' });
    res.status(200).json({ message: 'Xóa thương hiệu thành công' });
  });
});
// API để lấy danh sách người dùng
app.get('/api/nguoi-dung', (req, res) => {
  const query = 'SELECT * FROM nguoi_dung';
  db.query(query, (err, results) => {
    if (err) {
      res.status(500).send(err);
    } else {
      res.status(200).json(results);
    }
  });
});

// API để xem thông tin người dùng
app.get('/api/nguoi-dung/:id', (req, res) => {
  const { id } = req.params;
  const query = 'SELECT * FROM nguoi_dung WHERE ma_nguoi_dung = ?';
  db.query(query, [id], (err, results) => {
    if (err) {
      res.status(500).send(err);
    } else {
      res.status(200).json(results[0]);
    }
  });
});

// API để sửa thông tin người dùng
app.put('/api/nguoi-dung/:id', (req, res) => {
  const { id } = req.params;
  const { ten_nguoi_dung, email, vai_tro, so_dien_thoai, dia_chi } = req.body;

  const query = 'UPDATE nguoi_dung SET ten_nguoi_dung = ?, email = ?, vai_tro = ?, so_dien_thoai = ?, dia_chi = ? WHERE ma_nguoi_dung = ?';
  db.query(query, [ten_nguoi_dung, email, vai_tro, so_dien_thoai, dia_chi, id], (err, result) => {
    if (err) {
      res.status(500).send(err);
    } else {
      res.status(200).send('User updated successfully');
    }
  });
});

// API để xóa người dùng
app.delete('/api/nguoi-dung/:id', (req, res) => {
  const { id } = req.params;
  const query = 'DELETE FROM nguoi_dung WHERE ma_nguoi_dung = ?';
  db.query(query, [id], (err, result) => {
    if (err) {
      res.status(500).send(err);
    } else {
      res.status(200).send('User deleted successfully');
    }
  });
});

// API để phân quyền người dùng
app.put('/api/nguoi-dung/phanquyen/:id', (req, res) => {
  const { id } = req.params;
  const { vai_tro } = req.body;

  const query = 'UPDATE nguoi_dung SET vai_tro = ? WHERE ma_nguoi_dung = ?';
  db.query(query, [vai_tro, id], (err, result) => {
    if (err) {
      res.status(500).send(err);
    } else {
      res.status(200).send('User role updated successfully');
    }
  });
});
//api lây danh sách các tiunhr vn
app.get('/api/provinces', (req, res) => {
  const query = 'SELECT * FROM provinces';
  db.query(query, (err, results) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json(results);
    }
  });
});
// Giả sử bạn sử dụng Express.js cho API backend
app.get('/api/nguoi-dung/:id', (req, res) => {
  const userId = req.params.id;
  // Lấy thông tin người dùng từ cơ sở dữ liệu bằng userId
  const user = getUserFromDatabase(userId); // Giả sử đây là hàm lấy thông tin từ DB
  if (user) {
    res.json(user);
  } else {
    res.status(404).send('Người dùng không tìm thấy');
  }
});






// api sản phẩm tồn kho 

app.get('/api/sanpham/tonkho', (req, res) => {
  const query = 'SELECT SUM(so_luong_ton_kho) AS tong_so_luong_ton_kho FROM san_pham;';

  db.query(query, (err, results) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      const data = results[0];
      res.json(data);
    }
  });
});
app.get('/api/tongsanpham', (req, res) => {
  const query = 'SELECT COUNT(*) AS tong_san_pham FROM san_pham;';

  db.query(query, (err, results) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      const data = results[0];
      res.json(data);
    }
  });
});
app.get('/api/tongdonhang', (req, res) => {
  const query = 'SELECT COUNT(*) AS tong_don_hang FROM orders;';

  db.query(query, (err, results) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      const data = results[0];
      res.json(data);
    }
  });
});
app.get('/api/nguoidung', (req, res) => {
  const query = 'SELECT COUNT(*) AS nguoidung FROM nguoi_dung;';
  db.query(query, (err, results) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      const data = results[0];
      res.json(data);
    }
  });
});
app.get('/api/order/tongdoanhthu', (req, res) => {
  const query = 'SELECT checkoutCart , orderDate FROM `orders` where trangthai = "Giao hàng thành công";';
  db.query(query, (err, results) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json(results);
    }
  });
});



// up ảnh 
// Cấu hình lưu trữ ảnh

const uploadPath = path.join(__dirname, "uploads");
if (!fs.existsSync(uploadPath)) {
  fs.mkdirSync(uploadPath, { recursive: true });
}

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, uploadPath);
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + path.extname(file.originalname));
  }
});

const upload = multer({ storage });

app.post("/upload-avatar", upload.single("avatar"), async (req, res) => {
  if (!req.file) {
    return res.status(400).send("No file uploaded.");
  }

  const avatarPath = `/uploads/${req.file.filename}`;
  const { userId } = req.body;

  try {
    await updateUserAvatar(userId, avatarPath);
    res.send({ avatarPath });
  } catch (err) {
    res.status(500).send("Error uploading avatar.");
  }
});

const updateUserAvatar = async (userId, avatarPath) => {
  const query = "UPDATE nguoi_dung SET hinh = ? WHERE ma_nguoi_dung = ?";

  const params = [avatarPath, userId];

  try {
    await db.execute(query, params);
  } catch (error) {
    console.error("Error updating user avatar:", error);
    throw error;
  }
};

// Get comments for a product
app.get('/comments/:productId', async (req, res) => {
  try {
    const [rows] = await db.promise().query(`
            SELECT b.*, n.ten_nguoi_dung 
            FROM binh_luan b 
            JOIN nguoi_dung n ON b.ma_nguoi_dung = n.ma_nguoi_dung 
            WHERE b.ma_san_pham = ? 
            ORDER BY b.ngay_tao DESC
        `, [req.params.productId]);

    // Format the response data
    const formattedComments = rows.map(comment => ({
      ma_binh_luan: comment.ma_binh_luan,
      ma_san_pham: comment.ma_san_pham,
      ma_nguoi_dung: comment.ma_nguoi_dung,
      ten_nguoi_dung: comment.ten_nguoi_dung,
      noi_dung: comment.noi_dung,
      ngay_tao: comment.ngay_tao
    }));

    res.json(formattedComments);
  } catch (error) {
    console.error('Error fetching comments:', error);
    res.status(500).json({
      error: 'Internal server error',
      message: error.message
    });
  }
});

// Add a new comment
app.post('/comments', async (req, res) => {
  try {
    const { ma_san_pham, ma_nguoi_dung, noi_dung } = req.body;

    // Validate required fields
    if (!ma_san_pham || !ma_nguoi_dung || !noi_dung) {
      return res.status(400).json({
        error: 'Missing required fields',
        details: {
          ma_san_pham: !ma_san_pham ? 'Product ID is required' : null,
          ma_nguoi_dung: !ma_nguoi_dung ? 'User ID is required' : null,
          noi_dung: !noi_dung ? 'Comment content is required' : null
        }
      });
    }

    // Validate that user exists
    const [user] = await db.promise().query(
      'SELECT ma_nguoi_dung FROM nguoi_dung WHERE ma_nguoi_dung = ?',
      [ma_nguoi_dung]
    );

    if (!user.length) {
      return res.status(404).json({ error: 'User not found' });
    }

    // Insert comment
    const [result] = await db.promise().query(`
            INSERT INTO binh_luan (ma_san_pham, ma_nguoi_dung, noi_dung) 
            VALUES (?, ?, ?)
        `, [ma_san_pham, ma_nguoi_dung, noi_dung]);

    // Return success response with new comment ID
    res.json({
      success: true,
      id: result.insertId,
      message: 'Comment added successfully'
    });

  } catch (error) {
    console.error('Error adding comment:', error);
    res.status(500).json({
      error: 'Internal server error',
      message: error.message
    });
  }
});

// Thanh Toan momoo 
app.post("/payment", async (req, res) => {
  console.log(req.body);
  const accessKey = 'F8BBA842ECF85';
  const secretKey = 'K951B6PE1waDMi640xX08PD3vg6EkVlz';
  const orderInfo = 'pay with MoMo';
  const partnerCode = 'MOMO';
  const redirectUrl = 'http://localhost:4000/dongtab';
  const ipnUrl = 'https://webhook.site/b3088a6a-2d17-4f8d-a383-71389a6c600b';
  const requestType = "payWithMethod";
  const amount = '50000';
  const orderId = partnerCode + new Date().getTime();
  const requestId = orderId;
  const extraData = '';
  const lang = 'vi';

  // Signature creation
  const rawSignature = `accessKey=${accessKey}&amount=${amount}&extraData=${extraData}&ipnUrl=${ipnUrl}&orderId=${orderId}&orderInfo=${orderInfo}&partnerCode=${partnerCode}&redirectUrl=${redirectUrl}&requestId=${requestId}&requestType=${requestType}`;
  const signature = crypto.createHmac('sha256', secretKey)
    .update(rawSignature)
    .digest('hex');

  // Request body
  const requestBody = JSON.stringify({
    partnerCode,
    partnerName: "Test",
    storeId: "MomoTestStore",
    requestId,
    amount,
    orderId,
    orderInfo,
    redirectUrl,
    ipnUrl,
    lang,
    requestType,
    autoCapture: true,
    extraData,
    signature
  });

  // Send HTTPS request to MoMo API
  const options = {
    hostname: 'test-payment.momo.vn',
    port: 443,
    path: 'https://test-payment.momo.vn/v2/gateway/api/create',
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Content-Length': Buffer.byteLength(requestBody)
    }
  };
  const apiRequest = https.request(options, apiResponse => {
    console.log(`Status: ${apiResponse.statusCode}`);
    apiResponse.setEncoding('utf8');
    apiResponse.on('data', (body) => {
      const response = JSON.parse(body);
      console.log('resultCode:', response);
      return res.json(response.payUrl);

    });
  });
  apiRequest.on('error', (e) => {
    console.error(`Problem with request: ${e.message}`);
  });

  console.log("Sending....");
  apiRequest.write(requestBody);
  apiRequest.end();
});

// API đổi mật khẩu
app.post('/api/change-password', (req, res) => {
  const { email, oldPassword, newPassword } = req.body;

  // Kiểm tra dữ liệu đầu vào
  if (!email || !oldPassword || !newPassword) {
    return res.status(400).json({ 
      success: false, 
      message: 'Vui lòng cung cấp đầy đủ thông tin (email, mật khẩu cũ và mật khẩu mới).' 
    });
  }

  // Tìm user theo email
  const query = 'SELECT * FROM nguoi_dung WHERE email = ?';
  db.query(query, [email], (err, results) => {
    if (err) {
      console.error('Database query error:', err);
      return res.status(500).json({ 
        success: false, 
        message: 'Lỗi server. Vui lòng thử lại sau.' 
      });
    }

    if (results.length === 0) {
      return res.status(404).json({ 
        success: false, 
        message: 'Không tìm thấy tài khoản với email này.' 
      });
    }

    const user = results[0];

    // So sánh mật khẩu cũ
    bcrypt.compare(oldPassword, user.mat_khau, (err, isMatch) => {
      if (err) {
        console.error('Password comparison error:', err);
        return res.status(500).json({ 
          success: false, 
          message: 'Lỗi server. Vui lòng thử lại sau.' 
        });
      }

      if (!isMatch) {
        return res.status(401).json({ 
          success: false, 
          message: 'Mật khẩu cũ không chính xác.' 
        });
      }

      // Mã hóa mật khẩu mới
      bcrypt.hash(newPassword, 10, (err, hashedNewPassword) => {
        if (err) {
          console.error('Password hashing error:', err);
          return res.status(500).json({ 
            success: false, 
            message: 'Lỗi server khi mã hóa mật khẩu mới.' 
          });
        }

        // Cập nhật mật khẩu mới trong database
        const updateQuery = 'UPDATE nguoi_dung SET mat_khau = ? WHERE email = ?';
        db.query(updateQuery, [hashedNewPassword, email], (err, result) => {
          if (err) {
            console.error('Database update error:', err);
            return res.status(500).json({ 
              success: false, 
              message: 'Lỗi khi cập nhật mật khẩu mới.' 
            });
          }

          return res.json({
            success: true,
            message: 'Đổi mật khẩu thành công!'
          });
        });
      });
    });
  });
});

// Bắt đầu lắng nghe tại cổng đã chỉ định
app.listen(3000, () => console.log(`Ứng dụng đang chạy trên port 3000`));
