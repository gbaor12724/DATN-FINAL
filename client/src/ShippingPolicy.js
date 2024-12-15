import React from 'react';
import './asests/css/PrivacyPolicy.css'

const ShippingPolicy = () => {
  return (
    <div className="shipping-policy">
      <header>
        <h1>Chính Sách Vận Chuyển</h1>
      </header>

      <div className="container">
        <section>
          <h2>Chính Sách Vận Chuyển</h2>
          <p>
            Chính sách vận chuyển và các hạng mục liên quan đến hình thức thanh toán khi mua hàng tại hệ thống Luxury Shopping.
          </p>
          <p>
            Hành vi mua hàng trực tuyến từ luxshopping.vn hoặc tại cửa hàng của chúng tôi có thể được thực hiện bởi các cá nhân là cư dân của Việt Nam, hoặc bất kỳ quốc gia nào trên thế giới.
          </p>
        </section>

        <section>
          <h2>Giao Hàng</h2>
          <p>
            Chúng tôi cung cấp chính sách giao hàng toàn quốc và quốc tế với nhiều mức ưu đãi cực kỳ hấp dẫn nhằm mang đến cho khách hàng những trải nghiệm mua sắm thật an tâm, tin tưởng và hài lòng.
          </p>
          <ul>
            <li>Miễn phí giao hàng tại nội thành TP. Hồ Chí Minh trong vòng 1-2 giờ.</li>
            <li>Miễn phí giao hàng khu vực lân cận trong 1-3 ngày.</li>
            <li>Miễn phí giao hàng khu vực xa trong 3-5 ngày hoặc lâu hơn.</li>
            <li>Đối với đơn hàng quốc tế, vui lòng liên hệ trực tiếp để xác nhận thời gian giao hàng.</li>
          </ul>
        </section>

        <section>
          <h2>Phương Thức Thanh Toán</h2>
          <p>
            Các phương thức thanh toán tại Luxury Shopping bao gồm:
          </p>
          <ol>
            <li>Thanh toán bằng tiền mặt tại cửa hàng.</li>
            <li>Thanh toán qua thẻ ngân hàng tại cửa hàng.</li>
            <li>Thanh toán bằng chuyển khoản ngân hàng.</li>
            <li>Thanh toán qua dịch vụ COD (Cash On Delivery) cho khách hàng ngoài TP. Hồ Chí Minh.</li>
            <li>Thanh toán trực tuyến hoặc trả góp 0% lãi suất qua cổng AlePay.</li>
          </ol>
        </section>

        <section>
          <h2>Thông Tin Chuyển Khoản</h2>
          <div className="bank-info">
            <p>CÔNG TY TNHH XUẤT NHẬP KHẨU HÀNG HIỆU HOA KỲ</p>
            <p>Số tài khoản: 120 8888888</p>
            <p>Tại Ngân hàng TMCP Á Châu (ACB) - Chi nhánh HCM</p>
          </div>
          <p className="note">
            Lưu ý: Đối với các sản phẩm chưa có sẵn trong kho hàng tại Việt Nam, 
            khách hàng vui lòng đặt cọc 10-50% giá trị sản phẩm.
          </p>
        </section>

        <section>
          <h2>Thay Đổi Chính Sách</h2>
          <p>
            Chính sách này được khởi tạo vào ngày 12/11/2020. Mọi thay đổi sau sẽ được cập nhật trong các chính sách liên quan.
          </p>
        </section>

        <section className="contact-section">
          <h2>Liên Hệ</h2>
          <p>Luxury Shopping Vietnam</p>
        </section>
      </div>
    </div>
  );
};

export default ShippingPolicy;
