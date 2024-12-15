import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import { themSP } from './cartSlice';
import { useDispatch } from 'react-redux';
import './asests/css/style.css';
import { Link } from 'react-router-dom';
import baohanh from './images/baohanh.png';
import ReviewSection from './ReviewSection';

function Chitiet() {
    const dispatch = useDispatch();
    const { id } = useParams();
    const [product, setProduct] = useState(null);
    const [products, setProducts] = useState([]); // New state for products
    const [slideIndex, setSlideIndex] = useState(1);
    const [timer, setTimer] = useState({ days: "00", hours: "00", minutes: "00", seconds: "00" });
    const [error, setError] = useState(null); // Error handling state

    // Fetch product details
    useEffect(() => {
        const fetchProduct = async () => {
            try {
                const response = await fetch(`http://localhost:3000/donghonam/sanpham`);
                if (!response.ok) throw new Error("Network response was not ok");

                const data = await response.json();
                const productData = data.find(item => item.ma_san_pham === Number(id));
                if (productData) {
                    setProduct(productData);
                } else {
                    setError("Product not found");
                }
                setProducts(data); // Store all products
            } catch (error) {
                console.error("Error fetching product details:", error);
                setError("Error fetching product details");
            }
        };
        fetchProduct();
    }, [id]);
    // Countdown Timer
    useEffect(() => {
        const countDownDate = new Date().setHours(23, 59, 59, 999);
        const updateTimer = () => {
            const now = new Date().getTime();
            const distance = countDownDate - now;

            if (distance < 0) {
                setTimer({ days: "00", hours: "00", minutes: "00", seconds: "00" });
                return;
            }

            setTimer({
                days: String(Math.floor(distance / (1000 * 60 * 60 * 24))).padStart(2, '0'),
                hours: String(Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))).padStart(2, '0'),
                minutes: String(Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60))).padStart(2, '0'),
                seconds: String(Math.floor((distance % (1000 * 60)) / 1000)).padStart(2, '0')
            });
        };

        const interval = setInterval(updateTimer, 1000);
        return () => clearInterval(interval);
    }, []);

    // Slider Functions
    const changeSlide = (n) => {
        setSlideIndex(prevIndex => {
            const newIndex = prevIndex + n;
            return newIndex > 3 ? 1 : newIndex < 1 ? 3 : newIndex;
        });
    };
    const currentSlide = (n) => setSlideIndex(n);

    if (error) {
        return <div>{error}</div>;
    }

    if (!product) {
        return <div>Đang tải...</div>;
    }

    const displayedProducts = products.slice(0, 4);
    const truncateText = (text, length) => {
        return text.length > length ? text.substring(0, length) + '...' : text;
    };
    const addToFavorites = (product) => {
        const favorites = JSON.parse(localStorage.getItem('favorites')) || [];
        const updatedFavorites = favorites.some(item => item.ma_san_pham === product.ma_san_pham)
            ? favorites
            : [...favorites, product]; // Nếu sản phẩm đã có trong danh sách yêu thích thì không thêm nữa

        localStorage.setItem('favorites', JSON.stringify(updatedFavorites));
    };
    const addCart = (newProduct) => {
        const cart = JSON.parse(localStorage.getItem('listCart')) || [];
        const updatedCart = cart.some(item => item.ma_san_pham === newProduct.ma_san_pham)
            ? cart.map(item =>
                item.ma_san_pham === newProduct.ma_san_pham
                    ? { ...item, so_luong: item.so_luong + 1 }
                    : item
            )
            : [...cart, { ...newProduct, so_luong: 1 }];

        localStorage.setItem('listCart', JSON.stringify(updatedCart));
    };
    return (

        <>
            <div style={{ display: 'flex', alignItems: 'center', textAlign: 'center', paddingTop: '50px' }}>
            </div>

            <div className="container">
                <div className="quay-lai">
                    <a href="../#" style={{ color: 'black' }}>
                        <i className="fas fa-home" style={{ fontSize: '30px', textAlign: 'left' }}></i>
                        __RIXI LUXURY.com
                    </a>
                    <span style={{ fontSize: '14px' }}>&gt;</span>
                    <a href="../donghonu.html" style={{ color: 'black' }}>Nữ</a>
                </div>
                <table width="100%" style={{ alignContent: 'center' }}>
                    <tbody>
                        <tr>
                            <td width="40%">
                                <div className="bg">
                                    <div className="slider-container">
                                        <div className="slider">
                                            {[product.hinh, product.hinh2].map((image, index) => (
                                                <div key={index} className={`slide ${slideIndex === index + 1 ? "active" : ""}`}>
                                                    <img src={image} width="400" height="480" alt={product.ten_san_pham} />
                                                </div>
                                            ))}
                                        </div>
                                        <div className="navigation">
                                            <button className="prev" onClick={() => changeSlide(-1)}>&#10094;</button>
                                            <button className="next" onClick={() => changeSlide(1)}>&#10095;</button>
                                        </div>
                                        <div className="thumbnail-navigation">
                                            {[product.hinh, product.hinh2].map((image, index) => (
                                                <div
                                                    key={index}
                                                    className={`thumbnail ${slideIndex === index + 1 ? "active" : ""}`}
                                                    onClick={() => currentSlide(index + 1)}
                                                >
                                                    <img src={image} width="80" height="80" alt={`Thumbnail ${index + 1}`} />
                                                </div>

                                            ))}
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td width="60%">
                                <h2 style={{ textAlign: 'center' }}><strong>{product.ten_san_pham}</strong></h2>
                                <h5 style={{ textAlign: 'center' }}>
                                    Giá gốc: <strike>{Number(product.Gia).toLocaleString('vi-VN')} VNĐ</strike>&ensp;
                                    Giá: <strong style={{ color: 'red' }}>{Number(product.gia_giam).toLocaleString('vi-VN')} VNĐ</strong>

                                </h5>
                                
                                <div className="chi-tiet">
                                    <p><i className="fa fa-map-marker" aria-hidden="true"></i> Mua sản phẩm tại showroom của <strong>RXLUXURY.com</strong></p>
                                    <p><i className="fa fa-clock-o" aria-hidden="true"></i> Khuyến mãi kết thúc sau <strong>{`${timer.days} ngày ${timer.hours}:${timer.minutes}:${timer.seconds}`}</strong></p>
                                    <p><i className="fa fa-truck" aria-hidden="true"></i> Miễn phí vận chuyển trên toàn quốc</p>
                                    <p><i className="fa fa-heartbeat" aria-hidden="true"></i> Bảo hành chính hãng</p>
                                    <p><i className="fa fa-gift" aria-hidden="true"></i> Quà tặng hấp dẫn khi mua kèm sản phẩm</p>
                                    <p><i className="fa fa-refresh" aria-hidden="true"></i> Đổi hàng miễn phí trong 7 ngày khi chưa sử dụng</p>
                                </div>
                                <div className='tragop'>
                                    <button onClick={() => addCart(product)}>Thêm vào giỏ</button>
                                    <button onClick={() => addToFavorites(product)}>Thêm vào yêu thích</button>
                                    &ensp;
                                    {/* <button >MUA NGAY</button> */}
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div className="container">
                <div className="thong-so-wrapper" style={{
                    padding: '40px',
                    backgroundColor: '#f8f8f8',
                    borderRadius: '8px'
                }}>
                    <h2 style={{
                        textAlign: 'center',
                        marginBottom: '40px',
                        fontSize: '24px',
                        letterSpacing: '2px'
                    }}>THÔNG SỐ</h2>
                    
                    <div style={{
                        display: 'grid',
                        gridTemplateColumns: '1fr 1fr',
                        gap: '20px',
                        maxWidth: '1000px',
                        margin: '0 auto'
                    }}>
                        <div className="spec-item" style={{
                            display: 'flex',
                            borderBottom: '1px solid #eee',
                            padding: '15px 0'
                        }}>
                            <span style={{width: '150px', color: '#666'}}>Bộ sưu tập</span>
                            <span style={{flex: 1}}>: {product.bo_suu_tap || 'TRUE SQUARE'}</span>
                        </div>
                        <div className="spec-item" style={{
                            display: 'flex',
                            borderBottom: '1px solid #eee',
                            padding: '15px 0'
                        }}>
                            <span style={{width: '150px', color: '#666'}}>Mã sản phẩm</span>
                            <span style={{flex: 1}}>: {product.ma_san_pham}</span>
                        </div>
                        
                        <div className="spec-item" style={{
                            display: 'flex',
                            borderBottom: '1px solid #eee',
                            padding: '15px 0'
                        }}>
                            <span style={{width: '150px', color: '#666'}}>Giới tính</span>
                            <span style={{flex: 1}}>: {product.nam_nu || 'Unisex'}</span>
                        </div>
                        <div className="spec-item" style={{
                            display: 'flex',
                            borderBottom: '1px solid #eee',
                            padding: '15px 0'
                        }}>
                            <span style={{width: '150px', color: '#666'}}>Loại máy</span>
                            <span style={{flex: 1}}>: {product.loai_may || 'Automatic'}</span>
                        </div>

                        <div className="spec-item" style={{
                            display: 'flex',
                            borderBottom: '1px solid #eee',
                            padding: '15px 0'
                        }}>
                            <span style={{width: '150px', color: '#666'}}>Đường kính</span>
                            <span style={{flex: 1}}>: {product.size_mat_so || '38mm'}</span>
                        </div>
                        <div className="spec-item" style={{
                            display: 'flex',
                            borderBottom: '1px solid #eee',
                            padding: '15px 0'
                        }}>
                            <span style={{width: '150px', color: '#666'}}>Màu sắc</span>
                            <span style={{flex: 1}}>: {product.mau_sac || 'Xanh'}</span>
                        </div>

                        <div className="spec-item" style={{
                            display: 'flex',
                            borderBottom: '1px solid #eee',
                            padding: '15px 0'
                        }}>
                            <span style={{width: '150px', color: '#666'}}>Phong cách</span>
                            <span style={{flex: 1}}>: {product.phong_cach || 'Fashion'}</span>
                        </div>
                        <div className="spec-item" style={{
                            display: 'flex',
                            borderBottom: '1px solid #eee',
                            padding: '15px 0'
                        }}>
                            <span style={{width: '150px', color: '#666'}}>Chất liệu dây</span>
                            <span style={{flex: 1}}>: {product.loai_day || 'Dây Đá Ceramic'}</span>
                        </div>

                        <div className="spec-item" style={{
                            display: 'flex',
                            borderBottom: '1px solid #eee',
                            padding: '15px 0'
                        }}>
                            <span style={{width: '150px', color: '#666'}}>Tính năng</span>
                            <span style={{flex: 1}}>: {product.tinh_nang || 'Time'}</span>
                        </div>
                        <div className="spec-item" style={{
                            display: 'flex',
                            borderBottom: '1px solid #eee',
                            padding: '15px 0'
                        }}>
                            <span style={{width: '150px', color: '#666'}}>Độ chịu nước</span>
                            <span style={{flex: 1}}>: {product.chong_nuoc || '5 ATM'}</span>
                        </div>
                    </div>
                </div>
            </div>
            {/* Phần đánh giá sản phẩm */}
            <div className="container" style={{ marginTop: "50px" }}>
                <ReviewSection productId={id} />
            </div>
            <section>
                <div className="container" style={{ maxWidth: '1264px' }}>
                    <div style={{ display: 'flex', alignItems: 'center', textAlign: 'center', paddingTop: '50px' }}>
                        <h4>SẢN PHẨM LIÊN QUAN</h4>
                        <hr style={{ flex: 1, border: 'none', borderTop: '1px solid black', margin: '0 10px' }} />
                    </div>
                    <div className="bg" style={{ width: '1230px' }}>
                        <div className="row">
                            {displayedProducts.map((product, index) => (
                                <div className="col-md-3 col-sm-12" key={index}>
                                    <div className="card">
                                        <Link to={`/chitiet/${product.ma_san_pham}`}>
                                            <img className="card-img-top" src={product.hinh} alt={product.ten_san_pham} />
                                        </Link>
                                        <p style={{ textAlign: 'center' }}>{truncateText(product.ten_san_pham, 20)}</p>
                                        <p className="product-price" style={{ textAlign: 'left', marginLeft: '14px', marginBottom: '20px' }}>
                                            Giá gốc: <span style={{ textDecoration: 'line-through', color: 'black' }}>
                                                {Number(product.Gia).toLocaleString('vi-VN')} VNĐ
                                            </span>
                                            <br />
                                            <span style={{ fontWeight: 'bold', color: 'red' }}>
                                                Giá: {Number(product.gia_giam).toLocaleString('vi-VN')} VNĐ
                                            </span>
                                        </p>

                                        <p className="product-buttons" style={{ textAlign: 'center' }}>
                                            <button onClick={() => addCart(product)}>Giỏ Hàng </button>
                                            <button onClick={() => addToFavorites(product)}>Yêu Thích</button>
                                        </p>
                                    </div>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>
            </section>
            <div style={{ height: '10px' }}></div>
            <div className="container1">
                <div className="pagination">
                    <Link to="/index">&laquo;</Link>
                    <Link className="active" to="#">1</Link>
                    <Link to="/admin/404">2</Link>
                    <Link to="/admin/404">3</Link>
                    <Link to="/admin/404">4</Link>
                    <Link to="/admin/404">&raquo;</Link>
                </div>
            </div>
          
        </>
    );
    
}

export default Chitiet;
