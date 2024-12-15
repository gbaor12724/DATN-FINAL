import React, { useEffect, useState } from 'react';
import './asests/css/Thanhtoan.css';
import axios from 'axios';
import Dongtab from './admin/component/dongtab';

const Thanhtoan = () => {
    const [checkoutCart, setCheckoutCart] = useState([]);
    const [formData, setFormData] = useState({
        name: '',
        email: '',
        phone: '',
        trangthai: 'Chờ xử lý',
        address: '',
        city: '',
        notes: '',
        paymentMethod: 'cod',
        agreeTerms: false,
    });
    const [cities, setCities] = useState([]);
    const [LoaiThanhToan, setLoaiThanhToan] = useState('cod');

    // Get cart information from localStorage
    useEffect(() => {
        const storedCart = JSON.parse(localStorage.getItem('checkoutCart')) || [];
        setCheckoutCart(storedCart);

        // Get user info from localStorage
        const storedUser = localStorage.getItem('user');
        if (storedUser) {
            const parsedUser = JSON.parse(storedUser);
            setFormData(prevFormData => ({
                ...prevFormData,
                email: parsedUser.email, // Auto-fill email from user data
            }));
        }
    }, []);

    // Fetch city list from API
    useEffect(() => {
        const fetchCities = async () => {
            try {
                const response = await axios.get('http://localhost:3000/api/provinces');
                setCities(response.data);
            } catch (err) {
                console.error('Error fetching cities: ', err);
            }
        };
        fetchCities();
    }, []);

    const handleChange = (e) => {
        const { name, value, type, checked } = e.target;
        setFormData(prevData => ({
            ...prevData,
            [name]: type === 'checkbox' ? checked : value,
        }));
        if (name === 'paymentMethod') {
            setLoaiThanhToan(value);
        }
    };
 
    const handleSubmit = async (e) => {
        e.preventDefault();
        if (LoaiThanhToan === "online") {
            const tongtien = checkoutCart.reduce((total, item) => total + item.so_luong * item.Gia, 0);
            try {
                const response = await axios.post('http://localhost:3000/payment', { amount: tongtien });
                if (response.data) {
                    window.open(response.data, '_blank', 'width=1918,height=944');
                    setTimeout(()=>{
                        window.location.href ="http://localhost:4000/thankciu"
                    },5000)
                } else {
                    console.log("Không có URL thanh toán trong phản hồi.");
                }
            } catch (error) {
                console.log('Error:', error);
            }


        } else {
            if (!formData.name || !formData.email || checkoutCart.length === 0) {
                alert('Please fill in all required fields and select at least one product.');
                return;
            }

            // Prepare order data
            const orderData = {
                ...formData,
                checkoutCart,
                orderDate: new Date(),
            };

            try {
                const response = await axios.post('http://localhost:3000/api/orders', orderData);
                if (response.status === 201) {
                    alert('Order placed successfully!');
                    localStorage.removeItem('checkoutCart');
                }
            } catch (err) {
                alert('An error occurred while placing the order: ' + err.message);
            }
        }
    };

    return (
        <div className="thanhtoan-container">
            <form className="thanhtoan-form" onSubmit={handleSubmit}>
                <div className="thanhtoan-left">
                    <h2>Thông tin giao hàng</h2>
                
                    <label>
                        Tên khách hàng
                        <input type="text" name="name" value={formData.name} onChange={handleChange} required />
                    </label>
                    <label>
                        Email
                        <input 
                            type="email" 
                            name="email" 
                            value={formData.email} 
                            onChange={handleChange} 
                            required 
                            readOnly
                        />
                    </label>
                    <label>
                        Số điện thoại
                        <input type="text" name="phone" value={formData.phone} onChange={handleChange} required />
                    </label>
                    <label>
                        Địa chỉ
                        <input type="text" name="address" value={formData.address} onChange={handleChange} required />
                    </label>
                    <label>
                        Thành phố
                        <select name="city" value={formData.city} onChange={handleChange} required>
                            <option value="">Chọn tỉnh/thành phố</option>
                            {cities.map(city => (
                                <option key={city.id} value={city.name}>{city.name}</option>
                            ))}
                        </select>
                    </label>
                    <label>
                        Ghi chú
                        <textarea name="notes" value={formData.notes} onChange={handleChange}></textarea>
                    </label>
                    <div class="terms-checkbox">
                        <input type="checkbox" id="terms" required />
                        <label for="terms">Đồng ý với điều khoản</label>
                    </div>
                </div>

                <div className="thanhtoan-right">
                    <h3>Giỏ hàng của bạn</h3>
                    {checkoutCart.length === 0 ? (
                        <p>Không có sản phẩm trong giỏ hàng.</p>
                    ) : (
                        <table className="table">
                            <thead>
                                <tr>
                                    <th>Hình ảnh</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Số tiền</th>
                                    <th>Số lượng</th>
                                    <th>Tổng tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                {checkoutCart.map(sp => (
                                    <tr key={sp.ma_san_pham}>
                                        <td>
                                            <img className="product-img" src={sp.hinh} alt={sp.ten_san_pham} style={{ width: '50px', height: '50px', objectFit: 'cover' }} />
                                        </td>
                                        <td>{sp.ten_san_pham}</td>
                                        <td>{Number(sp.Gia).toLocaleString('vi')} VNĐ</td>
                                        <td>{sp.so_luong}</td>
                                        <td>{(Number(sp.Gia) * sp.so_luong).toLocaleString('vi')} VNĐ</td>
                                    </tr>
                                ))}
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colSpan="4">Tổng tiền:</td>
                                    <td>
                                        <strong>
                                            {checkoutCart.reduce((total, item) => total + item.so_luong * item.Gia, 0).toLocaleString('vi')} VNĐ
                                        </strong>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    )}

                    <div className="payment-options">
                        <label>
                            <input
                                type="radio"
                                name="paymentMethod"
                                value="cod"
                                checked={formData.paymentMethod === 'cod'}
                                onChange={handleChange}
                            />
                            Thanh toán khi nhận hàng
                        </label>
                        <label>
                            <input
                                type="radio"
                                name="paymentMethod"
                                value="online"
                                checked={formData.paymentMethod === 'online'}
                                onChange={handleChange}
                            />
                            Thanh toán online
                            </label>
                    </div>

                    <button type="submit">Đặt hàng</button>
                </div>
            </form>
        </div>
    );
};

export default Thanhtoan;