import React from 'react';
import logo from './images/logo-luxury.png';
import './asests/css/Footer.css';

const Footer = () => {
    return (
        <footer className="footer">
            <div className="footer-container">
                <div className="footer-main">
                    <div className="footer-logo-section">
                        <img src={logo} alt="Logo" className="logo" />
                        <p className="company-description">
                            Luxury Shopping - Nơi mang đến những trải nghiệm mua sắm sang trọng và đẳng cấp nhất cho khách hàng.
                        </p>
                    </div>
                    <div className="footer-content">
                        <div className="footer-info-section">
                            <h3>Thông tin liên hệ</h3>
                            <p>Tòa nhà QTSC9 (toà T), đường Tô Ký, phường Tân Chánh Hiệp, quận 12, TP HCM.</p>
                            <p>Fax: 0272.123.121</p>
                            <p>SĐT: 028.6686.6486</p>
                            <p>Email: FPT@gmail.com</p>
                        </div>
                        <div className="footer-info-section">
                            <h3>Tổng đài hỗ trợ</h3>
                            <p className="hotline">1800 0999</p>
                            <p>Feedbacks</p>
                            <p>0868855855</p>
                        </div>
                        <div className="footer-info-section">
                            <h3>Chính sách</h3>
                            <ul>
                                <li><a href="/privacy-policy">Chính sách bảo mật</a></li>
                                <li><a href="/terms-of-service">Điều khoản sử dụng</a></li>
                                <li><a href="/return-policy">Chính sách đổi trả</a></li>
                                <li><a href="/shipping-policy">Chính sách vận chuyển</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div className="footer-bottom">
                <p>&copy; 2024 Luxury Shopping. All rights reserved.</p>
            </div>
        </footer>
    );
};

export default Footer;
