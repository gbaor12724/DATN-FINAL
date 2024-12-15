import React from 'react';
import './asests/css/PrivacyPolicy.css'

const Section = ({ number, title, list }) => (
  <section>
    <h3>{`Mục ${number}: ${title}`}</h3>
    <ul>
      {list.map((item, index) => (
        <li key={index}>{item}</li>
      ))}
    </ul>
  </section>
);

const PrivacyPolicy = () => {
  return (
    <div>
   
        <h1>Chính Sách Bảo Mật</h1>

 

      <div className="container">
        <section>
          <h2>Tuyên Bố Chính Sách Bảo Mật</h2>
          <p>
            Tài liệu này đề ra Chính sách bảo mật của Công ty TNHH Xuất Nhập Khẩu Hàng Hiệu Hoa Kỳ, đồng thời giải thích cách chúng tôi thu thập và sử dụng thông tin cá nhân của bạn liên quan đến mối quan hệ giữa bạn và Luxury Shopping.
          </p>
          <ul>
            <li>Thông qua việc sử dụng website luxshopping.vn và các ứng dụng liên quan.</li>
            <li>Bằng cách ghé thăm showroom của Luxury Shopping.</li>
            <li>Bằng cách liên hệ với bộ phận chăm sóc khách hàng của Luxury Shopping.</li>
          </ul>
          <p className="important">
            Vui lòng đọc kỹ phần sau để hiểu quan điểm và cách chúng tôi xử lý thông tin của bạn.
          </p>
        </section>

        <section>
          <h2>Luxury Shopping là ai?</h2>
          <p>
            Luxury Shopping là cơ sở đại diện của Công ty TNHH XNK Hàng Hiệu Hoa Kỳ được thành lập từ 28/04/2014 với sự góp mặt của nhiều bộ phận hành chính khác nhau. Chính sách quyền riêng tư này được ban hành thay mặt cho toàn thể công ty. Vì vậy, khi chúng tôi đề cập đến “Luxury Shopping”, “Công ty TNHH XNK Hàng Hiệu Hoa Kỳ” hoặc “chúng tôi” trong Chính sách bảo mật này, có nghĩa là chúng tôi đang đề cập đến tất cả những đơn vị, phòng ban và bộ phận cấp cao của công ty.
          </p>
          <p>
            Luxury Shopping là một công ty đã đăng ký kinh doanh tại Việt Nam với Mã số thuế 0312756049 và địa chỉ đăng ký của chúng tôi là 331 Nguyễn Đình Chiểu, Phường 5, Quận 3, Thành phố Hồ Chí Minh.
          </p>
        </section>

        <section>
          <h2>Mục Đích và Phạm Vi Thu Thập Thông Tin</h2>
          <p>
            ‘Thông tin’ ở đây mà chúng tôi đề cập đến là những thông tin cá nhân của bạn mà chúng tôi thu thập, sử dụng, chia sẻ, lưu trữ và chuyển giao dưới dạng vật lý và điện tử. Thông tin này có thể được nhóm lại với nhau trong các loại sau:
          </p>
          <ul>
            <li>Thông tin nhận dạng và liên hệ: tên, họ, tiêu đề, ngày sinh, địa chỉ email, số điện thoại, địa chỉ giao hàng, địa chỉ thanh toán.</li>
            <li>Thông tin kỹ thuật: địa chỉ IP, hệ điều hành, trình duyệt và nền tảng công nghệ.</li>
            <li>Thông tin hồ sơ: lịch sử mua sắm, sản phẩm yêu thích, danh sách mong muốn.</li>
            <li>Thông tin sử dụng: cách sử dụng website hoặc ứng dụng liên quan.</li>
          </ul>
        </section>

        <section>
          <h2>Cách mà Luxury Shopping thu thập thông tin</h2>
          <p>Thông tin có thể được thu thập qua các cách sau:</p>
          <ul>
            <li>Đăng ký tài khoản trên website.</li>
            <li>Đặt hàng hoặc nhận tư vấn sản phẩm.</li>
            <li>Tham gia các chương trình khách hàng thân thiết hoặc khảo sát.</li>
            <li>Đăng ký email để nhận bản tin mới nhất từ Luxury Shopping.</li>
            <li>Liên hệ với bộ phận chăm sóc khách hàng của chúng tôi.</li>
            <li>Phản hồi thông tin hoặc gửi feedback đến Luxury Shopping.</li>
          </ul>
        </section>

        <section>
          <h2>Phạm vi sử dụng thông tin</h2>
          <p>Chúng tôi sử dụng thông tin của bạn để:</p>
          <ul>
            <li>Giao hàng, cung cấp dịch vụ khách hàng, xử lý thanh toán.</li>
            <li>Gửi thư cảm ơn, giới thiệu sản phẩm mới.</li>
            <li>Ngăn chặn gian lận và bảo mật thông tin của bạn.</li>
          </ul>
        </section>

        <section>
          <h2>Quyền lợi của bạn</h2>
          <p>Bạn có quyền:</p>
          <ul>
            <li>Yêu cầu quyền truy cập hoặc bản sao thông tin của bạn.</li>
            <li>Cải chính thông tin nếu cần thiết.</li>
            <li>Rút lại sự đồng ý với việc xử lý thông tin.</li>
          </ul>
        </section>

        <section>
          <h2>Cam kết bảo mật thông tin cá nhân</h2>
          <p>Chúng tôi cam kết bảo vệ thông tin của bạn bằng các phương pháp bảo mật tiên tiến, bao gồm mã hóa thông tin và lưu trữ trên các máy chủ an toàn.</p>
        </section>

        <section>
          <h2>Thời gian lưu trữ thông tin</h2>
          <p>Chúng tôi sẽ lưu trữ thông tin của bạn cho đến khi không còn cần thiết để cung cấp dịch vụ hoặc khi bạn yêu cầu xóa thông tin.</p>
        </section>
      </div>

      <div className="container">
        <Section
          number="1"
          title="Danh tính và thông tin liên lạc"
          list={[
            "Để giao hàng cho bạn",
            "Để cung cấp phương pháp chăm sóc khách hàng và/hoặc tư vấn bảo dưỡng đồng hồ.",
            "Để tạo và quản lý tài khoản Luxury Shopping của bạn",
            "Để cung cấp các dịch vụ và hỗ trợ khách hàng, xử lý yêu cầu và lợi nhuận",
            "Để gửi các kiểm tra an toàn tài chính",
            "Để liên lạc với bạn",
            "Để ghi danh bạn vào Chương trình thực tập của chúng tôi hoặc danh sách ứng viên tuyển dụng của Luxury Shopping."
          ]}
        />
        <Section
          number="2"
          title="Thông tin tài chính"
          list={[
            "Thanh toán và hoàn tiền",
            "Để đảm bảo và phát hiện gian lận"
          ]}
        />
        <Section
          number="3"
          title="Thông tin giao dịch"
          list={[
            "Để cung cấp sản phẩm bạn đặt hàng cho bạn",
            "Để cung cấp các dịch vụ và hỗ trợ khách hàng, xử lý yêu cầu và lợi nhuận"
          ]}
        />
        <Section
          number="4"
          title="Thông tin kỹ thuật và sử dụng"
          list={[
            "Để cải thiện trang web của chúng tôi hay mọi ứng dụng khác và đặt các tùy chọn mặc định cho bạn.",
            "Để giữ cho trang web của chúng tôi an toàn và bảo mật."
          ]}
        />
        <Section
          number="5"
          title="Thông tin cá nhân"
          list={[
            "Để đưa ra đề xuất và giới thiệu cho bạn sản phẩm, hoặc dịch vụ có thể quan tâm.",
            "Để gửi ý tưởng và gợi ý các sản phẩm bảo dưỡng & sửa chữa đồng hồ mà bạn có thể quan tâm.",
            "Để phản hồi yêu cầu của bạn và thực hiện."
          ]}
        />
        <Section
          number="6"
          title="Thông tin marketing và truyền thông"
          list={[
            "Để gửi thư cảm ơn, giới thiệu sản phẩm, dịch vụ, ưu đãi của Luxury Shopping."
          ]}
        />
        <Section
          number="7"
          title="Lịch sử liên lạc"
          list={[
            "Để cung cấp chăm sóc và hỗ trợ khách hàng."
          ]}
        />
        <Section
          number="8"
          title="Thông tin xã hội"
          list={[
            "Để cho phép bạn đăng nhập vào trang web của chúng tôi dễ dàng mà không cần tạo tài khoản.",
            "Để đề xuất các chương trình quảng bá xã hội nếu bạn muốn."
          ]}
        />
        <Section
          number="9"
          title="Cơ sở pháp lý để xử lý"
          list={[
            "Để thực hiện các giao dịch, hợp đồng mà bạn sẽ là một bên tham gia và thực hiện các bước trước khi bạn giao dịch.",
            "Để tuân thủ các nghĩa vụ pháp lý chúng tôi phải thực hiện.",
            "Để thực hiện quyền lợi hợp pháp của chúng tôi."
          ]}
        />
      </div>


    </div>
  );
};

export default PrivacyPolicy;
