import React from "react";
import { Routes, Route, Link } from "react-router-dom";
import ArticleDetail from "./ArticleDetail";
import "./asests/css/watchKnowledge.css";

const WatchKnowledge = () => {
  const articles = [
    {
      title: "10 ĐIỀU CÓ THỂ BẠN CHƯA BIẾT VỀ ĐỒNG HỒ VICTORINOX",
      date: "12/12/2024",
      author: "Delwyn Huỳnh",
      description:
        "Đồng hồ Victorinox mang phong cách Quân đội Thụy Sĩ luôn là sự lựa chọn hàng đầu của phái mạnh. Sau đây là 10 điều có thể bạn chưa biết ...",
      imageUrl:
        "https://cdn.luxshopping.vn/Thumnails/Uploads/News/thiet-ke-chua-co-ten-4-7.png_390_260.webp",
    },
    {
      title: "HƯỚNG DẪN CÁCH VỆ SINH ĐỒNG HỒ MẠ VÀNG",
      date: "12/12/2024",
      author: "Luxury Shopping",
      description:
        "Đồng hồ mạ vàng là một kiểu đồng hồ rất được ưa chuộng ngày nay bởi sự sang trọng và rạng rỡ mà nó mang lại với mức giá phải chăng. Tuy ...",
      imageUrl:
        "https://cdn.luxshopping.vn/Thumnails/Uploads/News/huong-dan-ve-sinh-dong-ho-ma-vang-tai-nha.jpg_390_260.webp",
    },
    {
      title:
        "Van khí Helium (Helium Escape Valve) là gì? Chức năng và cách thức hoạt động",
      date: "11/12/2024",
      author: "Luxury Shopping",
      description:
        "Van khí Helium, hay còn gọi là Helium Escape Valve (HEV), là một tính năng cơ học đặc biệt được tích hợp trên các dòng đồng hồ lặn cao ...",
      imageUrl:
        "https://cdn.luxshopping.vn/Thumnails/Uploads/News/124.png_390_260.webp",
    },
  ];

  const news = [
    {
      title: "Tissot PRX - Cổ Điển Nhưng Vẫn Đậm Tính Thể Thao",
      date: "12/12/2024",
      author: "Magnus",
      description:
        "Bộ sưu tập Tissot PRX được ra mắt vào năm 1978 với thiết kế phẳng đặc trưng...",
      imageUrl:
        "https://cdn.luxshopping.vn/Thumnails/Uploads/News/tissot-prx-co-dien-nhung-van-dam-tinh-the-thao-3.jpg_390_260.webp",
    },
    {
      title: "TAG Heuer trình làng mẫu đồng hồ dành cho người chơi Golf",
      date: "12/12/2024",
      author: "Luxury Shopping",
      description:
        "Giới thiệu đồng hồ TAG Heuer Connected Modular 45 'Golf Edition' dành cho golfer...",
      imageUrl:
        "https://cdn.luxshopping.vn/Thumnails/Uploads/News/banner-dong-ho-tag-heuer-connected-modular-45-golf-edition-1.jpg_390_260.webp",
    },
    {
      title: "CITIZEN DISNEY PRINCESS - Những nàng công chúa Disney bước vào thế giới...",
      date: "12/12/2024",
      author: "August Nguyễn",
      description:
        "Lấy cảm hứng từ những nàng công chúa Disney, Citizen giới thiệu bộ sưu tập đồng hồ...",
      imageUrl:
        "https://cdn.luxshopping.vn/Thumnails/Uploads/News/banner-bst-dong-ho-citizen-disney-princess-diamond.png_390_260.webp",
    },
  ];

  const WatchKnowledgeHome = () => (
    <div className="watch-knowledge-section">
      <h2>KIẾN THỨC ĐỒNG HỒ</h2>
      <div className="articles">
        {articles.map((article, index) => (
          <div key={index} className="article">
            <Link to={`/watch-knowledge/article/${index}`}>
              <img src={article.imageUrl} alt={article.title} className="article-image" />
              <h3>{article.title}</h3>
              <p className="date-author">
                Ngày: {article.date} - Tác giả: {article.author}
              </p>
              <p>{article.description}</p>
            </Link>
          </div>
        ))}
      </div>

      <h2>TIN TỨC MỚI</h2>
      <div className="articles">
        {news.map((item, index) => (
          <div key={index} className="article">
            <Link to={`/watch-knowledge/news/${index}`}>
              <img src={item.imageUrl} alt={item.title} className="article-image" />
              <h3>{item.title}</h3>
              <p className="date-author">
                Ngày: {item.date} - Tác giả: {item.author}
              </p>
              <p>{item.description}</p>
            </Link>
          </div>
        ))}
      </div>
    </div>
  );

  return (
    <Routes>
      <Route path="/" element={<WatchKnowledgeHome />} />
      <Route 
        path="/article/:id" 
        element={<ArticleDetail articles={articles} type="article" />} 
      />
      <Route 
        path="/news/:id" 
        element={<ArticleDetail articles={news} type="news" />} 
      />
    </Routes>
  );
};

export default WatchKnowledge;
