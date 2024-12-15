import React, { useEffect, useState } from 'react';
import { Line } from 'react-chartjs-2';
import { Chart as ChartJS, CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend } from 'chart.js';
import extractGiaNgay from './FormartDateAndPrice';
import '../assets/css/Chart.css';

ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend);

const Chart = () => {
  const [dataDoanhthu, setdataDoanhthu] = useState([]);
  useEffect(() => {
    const fetchDoanhThu = async () => {
      try {
        const response = await fetch('http://localhost:3000/api/order/tongdoanhthu');
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        const data = await response.json();
        console.log('Dữ liệu nhận được:', data); // Log dữ liệu

        const result = extractGiaNgay(data);
        const groupedItems = result.reduce((acc, item) => {
          const existingItem = acc.find(i => i.ngay_tao === item.ngay_tao);
          if (existingItem) {
            existingItem.Gia += item.Gia;
          } else {
            acc.push({ ...item });
          }
          return acc;
        }, []);
        console.log('Grouped Data:', groupedItems); // Log dữ liệu đã nhóm

        setdataDoanhthu(groupedItems);
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    };

    fetchDoanhThu();
  }, []);

  // Kiểm tra dataDoanhthu đã được cập nhật chưa
  useEffect(() => {
    console.log('dataDoanhthu:', dataDoanhthu);
  }, [dataDoanhthu]);

  // Tạo cấu hình cho biểu đồ
  const chartData = {
    labels: dataDoanhthu.map(item => item.ngay_tao),
    datasets: [
      {
        label: 'Doanh thu',
        data: dataDoanhthu.map(item => item.Gia),
        borderColor: '#8884d8',
        backgroundColor: 'rgba(136, 132, 216, 0.2)',
        fill: true,
        tension: 0.4,
        pointStyle: 'circle',
        pointRadius: 5,
        pointHoverRadius: 10,
      },
    ],
  };

  const config = {
    type: 'line',
    data: chartData,
    options: {
      responsive: true,
      plugins: {
        title: {
          display: true,
          text: 'Biểu đồ doanh thu theo ngày',
        },
        tooltip: {
          callbacks: {
            label: function (tooltipItem) {
              return `${tooltipItem.raw} VNĐ`;
            },
          },
        },
      },
      hover: {
        mode: 'nearest',
        intersect: false,
      },
    },
  };
  return (
    <div className="chart-container">
      {dataDoanhthu.length > 0 ? (
        <Line data={chartData} options={config.options} />
      ) : (
        <p>Loading...</p>
      )}
    </div>
  );

};

export default Chart;
