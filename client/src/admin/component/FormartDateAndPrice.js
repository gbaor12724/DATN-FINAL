import formartNumber from "./formartNumber"; 

export default function extractGiaNgay(cartData) {
  if (!Array.isArray(cartData)) {
    return [];
  }

  // Hàm format ngày
  function formartDay(day) {
    const date = new Date(day); 
    const year = date.getFullYear(); // Lấy năm
    const month = String(date.getMonth() + 1).padStart(2, '0'); // Tháng phải cộng thêm 1 vì getMonth() trả về từ 0 đến 11
    const dayOfMonth = String(date.getDate()).padStart(2, '0'); // Đảm bảo ngày luôn có 2 chữ số

    return `${dayOfMonth}/${month}/${year}`;
  }
  return cartData.flatMap((data) =>
    Array.isArray(data.checkoutCart)
      ? [
          {
            Gia: data.checkoutCart.reduce((total, currentItem) => {
              const giaNumber = parseFloat(currentItem.Gia.replace(/[^0-9.-]+/g, "")); 
              return total + giaNumber;
            }, 0), 
            ngay_tao: formartDay(data.orderDate)
          }
        ]
      : []
  );
}
