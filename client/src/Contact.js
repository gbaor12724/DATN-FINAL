import React, { useState } from 'react';
import emailjs from 'emailjs-com';
import './asests/css/Contact.css'; // Đảm bảo đường dẫn đúng

function Contact() {
    const [formData, setFormData] = useState({
        name: '',
        email: '',
        sdt: '',
        message: ''
    });
    const [statusMessage, setStatusMessage] = useState('');
    const [loading, setLoading] = useState(false);

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData({
            ...formData,
            [name]: value
        });
    };

    const validateForm = () => {
        const { email, sdt } = formData;
        const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        const phonePattern = /^[0-9]{10,15}$/;

        if (!emailPattern.test(email)) {
            setStatusMessage('Email không hợp lệ');
            return false;
        }

        if (!phonePattern.test(sdt)) {
            setStatusMessage('Số điện thoại không hợp lệ');
            return false;
        }

        return true;
    };

    const handleSubmit = async (e) => {
        e.preventDefault();

        if (!validateForm()) {
            return;
        }

        setLoading(true);
        setStatusMessage('');

        try {
            const result = await emailjs.send(
                'service_l7qxfjp',
                'template_6ntqhzr',
                {
                    from_name: formData.name,
                    from_email: formData.email,
                    phone: formData.sdt,
                    message: formData.message,
                },
                'myLC41mHVyDyWo4Sn'
            );

            if (result.status === 200) {
                setStatusMessage('Email đã được gửi thành công!');
                setFormData({ name: '', email: '', sdt: '', message: '' });
            } else {
                setStatusMessage('Lỗi khi gửi email. Vui lòng thử lại!');
            }
        } catch (error) {
            console.error('Lỗi khi gửi email:', error);
            setStatusMessage('Có lỗi xảy ra khi gửi email. Vui lòng thử lại sau.');
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="contact-container">
            <div className="contact-info">
                <h2>Liên Lạc Với Chúng Tôi</h2>
                <p>Chúng tôi mở cửa cho mọi ý kiến hoặc chỉ để trò chuyện</p>
                <p><i className="fas fa-map-marker-alt"></i> Địa chỉ: 198 Đường số 21, Phường 15, Quận 10, TP. Hồ Chí Minh</p>
                <p><i className="fas fa-phone-alt"></i> Điện thoại: +1235 2355 98</p>
                <p><i className="fas fa-envelope"></i> Email: info@cuasite.com</p>
                <p><i className="fas fa-globe"></i> Trang web: cuasite.com</p>
            </div>
            <div className="contact-form">
                <h1>Liên Hệ Chúng Tôi</h1>
                <p>Chúng tôi luôn sẵn sàng hỗ trợ bạn. Hãy để lại thông tin và chúng tôi sẽ liên hệ lại sớm nhất.</p>
                <form onSubmit={handleSubmit}>
                    <div className="form-group">
                        <label>Họ & Tên</label>
                        <input
                            type="text"
                            name="name"
                            value={formData.name}
                            onChange={handleChange}
                            required
                        />
                    </div>
                    <div className="form-group">
                        <label>SĐT</label>
                        <input
                            type="tel"
                            name="sdt"
                            value={formData.sdt}
                            onChange={handleChange}
                            required
                        />
                    </div>
                    <div className="form-group">
                        <label>Email</label>
                        <input
                            type="email"
                            name="email"
                            value={formData.email}
                            onChange={handleChange}
                            required
                        />
                    </div>
                    <div className="form-group">
                        <label>Nội dung</label>
                        <textarea
                            name="message"
                            value={formData.message}
                            onChange={handleChange}
                            required
                        ></textarea>
                    </div>
                    <button type="submit" disabled={loading}>
                        {loading ? 'Đang gửi...' : 'Gửi yêu cầu'}
                    </button>
                </form>
                {statusMessage && <div className="status-message">{statusMessage}</div>}
            </div>
        </div>
    );
}

export default Contact;
