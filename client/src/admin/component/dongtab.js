import React from "react";
import'../assets/css/Dongtab.css' // Import file CSS

// Component Dongtab để đóng tab
const Dongtab = () => {
    const handleCloseTab = () => {
        window.close();
    };

    return (
        <div className="dongtab-container">
            <h1 className="dongtab-title"> Đã thanh toán thành công vui lòng đóng tap để trở về  </h1>
            <button className="dongtab-button" onClick={handleCloseTab}>
                Đóng Tab
            </button>
        </div>
    );
};

export default Dongtab;
