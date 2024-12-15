import React, { useState, useEffect } from 'react';
import './asests/css/ReviewSection.css';
function ReviewSection({ productId }) {
  const [reviews, setReviews] = useState([]);
  const [newReview, setNewReview] = useState('');
  const [error, setError] = useState(null);
  
  const userInfo = JSON.parse(localStorage.getItem('user'));

  useEffect(() => {
      fetchReviews();
  }, [productId]);

  const fetchReviews = async () => {
      try {
          const response = await fetch(`http://localhost:3000/comments/${productId}`);
          if (!response.ok) throw new Error('Network response was not ok');
          const data = await response.json();
          setReviews(data);
      } catch (error) {
          console.error('Error fetching reviews:', error);
          setError('Error loading reviews');
      }
  };

  const handleSubmit = async (e) => {
      e.preventDefault();
      
      if (!userInfo) {
          setError('Please log in to post a review');
          return;
      }

      try {
          const response = await fetch('http://localhost:3000/comments', {
              method: 'POST',
              headers: {
                  'Content-Type': 'application/json',
              },
              body: JSON.stringify({
                  ma_san_pham: parseInt(productId),
                  ma_nguoi_dung: parseInt(userInfo.id),
                  noi_dung: newReview.trim()
              })
          });

          if (!response.ok) {
              const errorData = await response.json();
              throw new Error(errorData.error || 'Failed to post review');
          }

          setNewReview('');
          fetchReviews();
          
      } catch (error) {
          console.error('Error posting review:', error);
          setError(error.message);
      }
  };

  return (
      <div className="review-container">
          <div className="review-header">
              REVIEWS
          </div>
          
          <div className="review-form-container">
              <textarea
                  value={newReview}
                  onChange={(e) => setNewReview(e.target.value)}
                  placeholder="Write your review here..."
                  className="review-input"
              />
              
              <button 
                  onClick={handleSubmit}
                  className="review-submit-btn"
              >
                  Submit Review
              </button>

              {error && <div className="review-error">{error}</div>}
          </div>

          <div className="reviews-list">
              {reviews.map((review) => (
                  <div key={review.ma_binh_luan} className="review-item">
                      <div className="review-user">
                          <strong>TÊN:</strong> {review.ten_nguoi_dung}
                      </div>
                      <div className="review-content">
                          <strong>BÌNH LUẬN:</strong> {review.noi_dung}
                      </div>
                      <div className="review-date">
                          {new Date(review.ngay_tao).toLocaleDateString()}
                      </div>
                  </div>
              ))}
          </div>
      </div>
  );
}

export default ReviewSection;