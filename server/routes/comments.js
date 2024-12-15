const express = require('express');
const router = express.Router();
const pool = require('../config/rx_luxury');

// Lấy comments cho một sản phẩm
router.get('/:productId', async (req, res) => {
    try {
        const [rows] = await pool.execute(`
            SELECT b.*, n.ten_nguoi_dung 
            FROM binh_luan b 
            JOIN nguoi_dung n ON b.ma_nguoi_dung = n.ma_nguoi_dung 
            WHERE b.ma_san_pham = ? 
            ORDER BY b.ngay_tao DESC
        `, [req.params.productId]);
        res.json(rows);
    } catch (error) {
        console.error('Error fetching comments:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
});

// Thêm comment mới
router.post('/', async (req, res) => {
    try {
        const { ma_san_pham, ma_nguoi_dung, noi_dung } = req.body;
        
        const [result] = await pool.execute(`
            INSERT INTO binh_luan (ma_san_pham, ma_nguoi_dung, noi_dung) 
            VALUES (?, ?, ?)
        `, [ma_san_pham, ma_nguoi_dung, noi_dung]);

        if (result.affectedRows) {
            res.status(201).json({ 
                success: true, 
                message: 'Comment added successfully',
                commentId: result.insertId 
            });
        } else {
            throw new Error('Failed to insert comment');
        }
    } catch (error) {
        console.error('Error adding comment:', error);
        res.status(500).json({ message: 'Failed to add comment' });
    }
});

module.exports = router;