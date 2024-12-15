import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import '../assets/css/sanpham.css';

const Product = () => {
  const [products, setProducts] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const [productsPerPage] = useState(6); // Số lượng sản phẩm trên mỗi trang
  const [isEditing, setIsEditing] = useState(false);
  const [currentProduct, setCurrentProduct] = useState({ name: '', price: '', description: '' });
  const [selectedProductId, setSelectedProductId] = useState(null);

  useEffect(() => {
    fetch('http://localhost:3000/api/products')
      .then(response => response.json())
      .then(data => setProducts(data))
      .catch(error => console.error('Lỗi:', error));
  }, []);

  const handleDelete = (id) => {
    fetch(`http://localhost:3000/api/products/${id}`, {
      method: 'DELETE',
    })
      .then(response => response.json())
      .then(() => {
        alert('Sản phẩm đã được xóa');
        setProducts(products.filter(product => product.ma_san_pham !== id));
      })
      .catch(error => console.error('Lỗi xóa sản phẩm:', error));
  };

  const handleEdit = (product) => {
    setIsEditing(true);
    setCurrentProduct({
      id: product.ma_san_pham,
      name: product.ten_san_pham,
      price: product.Gia,
      description: product.mo_ta,
    });
  };

  const handleEditChange = (e) => {
    const { name, value } = e.target;
    setCurrentProduct(prevState => ({
      ...prevState,
      [name]: value,
    }));
  };

  const handleUpdateProduct = (e) => {
    e.preventDefault();
    const { name, price, description, id } = currentProduct;

    fetch(`http://localhost:3000/api/products/${id}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ name, price, description }),
    })
      .then((response) => response.json())
      .then(() => {
        alert('Sản phẩm đã được cập nhật');
        setIsEditing(false);
        fetch('http://localhost:3000/api/products')
          .then(response => response.json())
          .then(data => setProducts(data))
          .catch(error => console.error('Lỗi:', error));
      })
      .catch((error) => console.error('Lỗi cập nhật sản phẩm:', error));
  };

  const handleToggleProductDetails = (id) => {
    setSelectedProductId(prevId => (prevId === id ? null : id));
  };

  // Phân trang
  const indexOfLastProduct = currentPage * productsPerPage;
  const indexOfFirstProduct = indexOfLastProduct - productsPerPage;
  const currentProducts = products.slice(indexOfFirstProduct, indexOfLastProduct);

  const paginate = (pageNumber) => setCurrentPage(pageNumber);

  const totalPages = Math.ceil(products.length / productsPerPage);

  return (
    <div>
      <h2>Quản lý sản phẩm</h2>

      <div className={isEditing ? 'product-management hidden' : 'product-management'}>
        <Link to="/product/add" className="btn btn-primary">Thêm sản phẩm mới</Link>
        <div className="product-grid">
          {currentProducts.map((product) => (
            <div key={product.ma_san_pham} className="product-card">
              <img
                src={product.hinh}
                alt={product.ten_san_pham}
                onClick={() => handleToggleProductDetails(product.ma_san_pham)}
                className="product-image"
              />
              <h3>{product.ten_san_pham}</h3>
              {selectedProductId === product.ma_san_pham && (
                <div className="product-details">
                  <p className="price">{product.Gia} VND</p>
                  <p>{product.mo_ta}</p>
                  <button onClick={() => handleEdit(product)} className="btn btn-info">Sửa</button>
                  <button onClick={() => handleDelete(product.ma_san_pham)} className="btn btn-danger">Xóa</button>
                </div>
              )}
            </div>
          ))}
        </div>
      </div>

      {isEditing && (
        <div className="edit-product-form">
          <h3>Sửa sản phẩm</h3>
          <form onSubmit={handleUpdateProduct}>
            <div>
              <label>Tên sản phẩm:</label>
              <input
                type="text"
                name="name"
                value={currentProduct.name}
                onChange={handleEditChange}
                required
              />
            </div>
            <div>
              <label>Giá sản phẩm:</label>
              <input
                type="number"
                name="price"
                value={currentProduct.price}
                onChange={handleEditChange}
                required
              />
            </div>
            <div>
              <label>Mô tả:</label>
              <textarea
                name="description"
                value={currentProduct.description}
                onChange={handleEditChange}
                required
              />
            </div>
            <button type="submit">Cập nhật</button>
            <button type="button" className="cancel-btn" onClick={() => setIsEditing(false)}>Hủy</button>
          </form>
        </div>
      )}

      <div className="pagination">
        {[...Array(totalPages).keys()].map(number => (
          <button
            key={number + 1}
            onClick={() => paginate(number + 1)}
            className={currentPage === number + 1 ? 'active' : ''}
          >
            {number + 1}
          </button>
        ))}
      </div>
    </div>
  );
};

export default Product;