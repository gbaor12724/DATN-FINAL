import React from 'react';
import { useParams, Link } from 'react-router-dom';
import './asests/css/ArticleDetail.css';

const ArticleDetail = ({ articles }) => {
  const { id } = useParams();
  const article = articles[id];

  return (
    <div className="article-detail">
      <div className="breadcrumb">
        <Link to="/">Home</Link> {' > '}
        <Link to="/watch-knowledge">Kiến thức đồng hồ</Link> {' > '}
        <span>{article.title}</span>
      </div>

      <div className="article-content">
        <h1>{article.title}</h1>
        
        <div className="article-meta">
          <div className="author">
            <span>Author</span>
            <p>by {article.author}</p>
          </div>
          <div className="date">
            <span>Last modified: {article.date}</span>
          </div>
        </div>

        <div className="featured-image">
          <img src={article.imageUrl} alt={article.title} />
        </div>

        <div className="article-text">
          {/* Nội dung được chia thành các đoạn */}
          <p>{article.description}</p>
          
          <h2>Lịch sử đồng hồ Chanel Première</h2>
          <p>Chiếc đồng hồ đầu tiên của Chanel - cũng là Premiere, được sáng tạo vào tháng 10 năm 1987 bởi Jacques Helleu, đương thời là giám đốc nghệ thuật của Chanel...</p>

          <div className="timeline">
            <div className="timeline-item">
              <strong>Năm 1987:</strong> Thành lập Bộ phận Đồng hồ. Khai trương cửa hàng đồng hồ đầu tiên trên Đại lộ Montaigne.
            </div>
            <div className="timeline-item">
              <strong>Năm 1990:</strong> Cửa hàng đồng hồ thứ hai được mở tại số 7, Place Vendôme.
            </div>
            <div className="timeline-item">
              <strong>Năm 1997:</strong> Khai trương cửa hàng đồng hồ và trang sức đầu tiên tại 18, địa điểm Vendôme.
            </div>
          </div>

          <h2>Biểu tượng</h2>
          <p>Premiere chứa đựng các yếu tố đặc trưng có ý nghĩa quan trọng đối với lịch sử của Chanel...</p>

          <h2>Cổ điển thời thượng</h2>
          <p>Để đánh dấu sự khởi đầu buổi ra mắt vào năm 1987, Chanel đã mở các cửa hàng của riêng mình...</p>

          <h2>Bất hủ</h2>
          <p>Arnaud Chastaingt, giám đốc hiện tại của xưởng sáng tạo chế tác đồng hồ tại Chanel, định nghĩa Premiere là "hiện thân của tinh thần chế tác đồng hồ của Chanel"...</p>
        </div>

        <div className="article-footer">
          <Link to="/watch-knowledge" className="back-button">
            ← Quay lại danh sách bài viết
          </Link>
        </div>
      </div>
    </div>
  );
};

export default ArticleDetail;
