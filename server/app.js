const { default: axios } = require("axios");
const express = require("express");
const app = express();
const crypto = require('crypto');
const https = require('https'); 

app.use(express.json());
app.post("/payment", async (req, res) => {
    // Parameters
    const accessKey = 'F8BBA842ECF85';
    const secretKey = 'K951B6PE1waDMi640xX08PD3vg6EkVlz';
    const orderInfo = 'pay with MoMo';
    const partnerCode = 'MOMO';
    const redirectUrl = 'http://localhost:4000/';
    const ipnUrl = 'https://webhook.site/b3088a6a-2d17-4f8d-a383-71389a6c600b';
    const requestType = "payWithMethod";
    const amount = '50000';
    const orderId = partnerCode + new Date().getTime();
    const requestId = orderId;
    const extraData = '';
    const lang = 'vi';

    // Signature creation
    const rawSignature = `accessKey=${accessKey}&amount=${amount}&extraData=${extraData}&ipnUrl=${ipnUrl}&orderId=${orderId}&orderInfo=${orderInfo}&partnerCode=${partnerCode}&redirectUrl=${redirectUrl}&requestId=${requestId}&requestType=${requestType}`;
    const signature = crypto.createHmac('sha256', secretKey)
        .update(rawSignature)
        .digest('hex');

    // Request body
    const requestBody = JSON.stringify({
        partnerCode,
        partnerName: "Test",
        storeId: "MomoTestStore",
        requestId,
        amount,
        orderId,
        orderInfo,
        redirectUrl,
        ipnUrl,
        lang,
        requestType,
        autoCapture: true,
        extraData,
        signature
    });

    // Send HTTPS request to MoMo API
    const options = {
        hostname: 'test-payment.momo.vn',
        port: 443,
        path: 'https://test-payment.momo.vn/v2/gateway/api/create',
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Content-Length': Buffer.byteLength(requestBody)
        }
    };  
    const apiRequest = https.request(options, apiResponse => {
        console.log(`Status: ${apiResponse.statusCode}`);
        apiResponse.setEncoding('utf8');
        apiResponse.on('data', (body) => {
            const response = JSON.parse(body);
            console.log('resultCode:', response);
        });
    });
    apiRequest.on('error', (e) => {
        console.error(`Problem with request: ${e.message}`);
    });

    console.log("Sending....");
    apiRequest.write(requestBody);
    apiRequest.end();
});

app.listen(6000, () => {
    console.log(`Ứng dụng đang chạy trên port 6000`);
});
