import React, { useEffect, useState } from 'react';
import '../assets/css/Dashboad.css';
import Chart from './chart';
import fortmartNumber from './formartNumber';


export default function Dashboad() {
  const [tonKhoData, setTonKhoData] = useState({
    tong_so_luong_ton_kho : 0
  });
  const [tongsanpham, setTongsanpham] = useState({
    tong_san_pham:0
  });
  const [tongdonhang, setTongdonghang] = useState({
    tong_don_hang:0
  });
  const [nguoidung, setTongnguoidung] = useState({
    nguoidung:0
  });
  useEffect(() => {
    const fetchTonKho = async () => {
      try {
        const response = await fetch('http://localhost:3000/api/sanpham/tonkho');
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        const data = await response.json();
        setTonKhoData(data);
      } catch (error) {
        console.log('false');
      }
    };

    fetchTonKho();
  }, []);
  useEffect(() => {
    const fetchTonKho = async () => {
      try {
        const response = await fetch('http://localhost:3000/api/tongsanpham');
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        const data = await response.json();
        setTongsanpham(data);
      } catch (error) {
        console.log('false');
      }
    };

    fetchTonKho();
  }, []);
  useEffect(() => {
    const fetchTonKho = async () => {
      try {
        const response = await fetch('http://localhost:3000/api/tongdonhang');
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        const data = await response.json();
        setTongdonghang(data);
      } catch (error) {
        console.log('false');
      }
    };

    fetchTonKho();
  }, []);

  useEffect(() => {
    const fetchTonKho = async () => {
      try {
        const response = await fetch('http://localhost:3000/api/nguoidung');
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        const data = await response.json();
        setTongnguoidung(data);
      } catch (error) {
        console.log('false');
      }
    };

    fetchTonKho();
  }, []);
  return (
    <div>
      <div className="dashboard">
          <div className="dashboard-card">
            <div className="icon">📦</div>
            <h3 className="title">Tổng sản phẩm</h3>
            <p className="value">{tongsanpham.tong_san_pham}</p>
          </div>
          <div className="dashboard-card">
            <div className="icon">🏬</div>
            <h3 className="title">Sản phẩm tồn kho</h3>
            <p className="value">{tonKhoData.tong_so_luong_ton_kho}</p>
          </div>
          <div className="dashboard-card">
            <div className="icon">🛒</div>
            <h3 className="title">Đơn hàng đã đặt</h3>
            <p className="value">{tongdonhang.tong_don_hang}</p>
          </div>
          <div className="dashboard-card">
            <div className="icon">👤</div>
            <h3 className="title">Tài khoản đăng ký</h3>
            <p className="value">{nguoidung.nguoidung}</p>
          </div>
       
      </div>
      <h2 className="titleOder">Tổng doanh thu </h2>
     
       <Chart/>
       <h2 className="titleOder">sử lý đơn hàng </h2>
    </div>
  );
}
