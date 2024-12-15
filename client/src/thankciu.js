import React from "react";
import './asests/css/Thankciu.css'; // Đảm bảo bạn đã tạo file CSS và đặt cùng cấp

const Thankciu = () => {
    return (
        <div className="thankyou-container">
            <img
                src={require("./images/thankyou.jpg")} // Đảm bảo đường dẫn chính xác đến hình ảnh
                alt="Thank you"
                className="thankyou-image"
            />
            <p className="thankyou-text"></p>
            <a href="/" className="home-button">
                Quay về trang chủ
            </a>
        </div>
    );
};

export default Thankciu;