<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kerala Lottery Counter</title>
    <style>
        :root {
            --primary-color: #008744;
            --secondary-color: #005a2b;
            --light-green: #e6fffa;
            --border-green: #2ecc71;
            --background-light: #f7f9fc;
            --text-dark: #2d3748;
            --card-border: #e2e8f0;
            --live-red: #e53e3e;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
        }

        body {
            background-color: #1a202c;
            color: var(--text-dark);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 10px;
        }

        .phone-container {
            width: 100%;
            max-width: 440px;
            background: #ffffff;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 35px rgba(0,0,0,0.3);
            position: relative;
        }

        .gov-header {
            background: linear-gradient(135deg, #005a2b 0%, #008744 100%);
            padding: 16px;
            text-align: center;
            color: #ffffff;
            border-bottom: 4px solid var(--border-green);
        }

        .gov-header h1 {
            font-size: 1.3rem;
            font-weight: 800;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            margin-bottom: 4px;
        }

        .gov-sub-tag {
            font-size: 0.8rem;
            font-weight: 600;
            color: #d1fae5;
            background: rgba(255,255,255,0.15);
            padding: 3px 12px;
            border-radius: 50px;
            display: inline-block;
        }

        .hero-banner-wrapper {
            background: #ffffff;
            padding: 12px;
            display: flex;
            flex-direction: column;
            gap: 10px;
            border-bottom: 1px solid var(--card-border);
        }

        .booking-alert-box {
            display: flex;
            align-items: center;
            gap: 12px;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-left: 6px solid var(--primary-color);
            border-radius: 14px;
            padding: 10px 14px;
            box-shadow: 0 4px 12px rgba(0, 135, 68, 0.06);
        }

        .ticket-icon-circle {
            width: 36px;
            height: 36px;
            background-color: #e6fffa;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.1rem;
            flex-shrink: 0;
        }

        .booking-details-text {
            display: flex;
            flex-direction: column;
            width: 100%;
        }

        .booking-user-line {
            font-size: 0.9rem;
            color: #4a5568;
        }

        .booking-user-line strong {
            color: #1a202c;
            font-weight: 700;
        }

        .booking-stats-line {
            font-size: 0.85rem;
            color: #718096;
            font-weight: 500;
            display: flex;
            align-items: center;
        }

        .amount-paid {
            color: var(--primary-color);
            font-weight: 700;
            margin-left: auto;
        }

        .live-draw-box {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-left: 6px solid var(--live-red);
            padding: 10px 14px;
            border-radius: 14px;
        }

        .live-badge {
            background: var(--live-red);
            color: white;
            font-size: 0.65rem;
            font-weight: 800;
            padding: 3px 6px;
            border-radius: 4px;
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .ticker-dot {
            width: 6px;
            height: 6px;
            background-color: #ffffff;
            border-radius: 50%;
            animation: tiktik 0.6s infinite alternate;
        }

        .draw-title {
            font-size: 0.85rem;
            font-weight: 700;
            color: #1a202c;
            margin-left: 5px;
        }

        .ticker-text {
            font-size: 0.9rem;
            color: #1a202c;
            font-weight: 700;
            background: #fff5f5;
            padding: 4px 10px;
            border-radius: 6px;
            border: 1px solid #fed7d7;
        }

        .status-bar {
            background: #f8fafc;
            padding: 10px 14px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid var(--card-border);
            font-size: 0.8rem;
            font-weight: 700;
            color: var(--primary-color);
        }

        .form-body { padding: 20px; }
        .form-group { margin-bottom: 16px; }
        
        .form-group label {
            display: block;
            font-size: 0.75rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            color: #718096;
            margin-bottom: 6px;
        }

        .input-wrapper { position: relative; display: flex; align-items: center; }
        
        .input-wrapper input {
            width: 100%;
            padding: 12px 12px 12px 38px;
            border: 1.5px solid var(--card-border);
            border-radius: 10px;
            font-size: 0.95rem;
            outline: none;
            background: var(--background-light);
        }

        .input-wrapper input:focus {
            border-color: var(--primary-color);
            background: #ffffff;
        }

        .input-wrapper .icon { position: absolute; left: 14px; color: #a0aec0; }

        .ticket-container {
            border: 2px dashed var(--border-green);
            background: #ffffff;
            border-radius: 14px;
            padding: 14px;
            margin-bottom: 16px;
        }

        .ticket-title {
            color: #1a202c;
            font-weight: 700;
            font-size: 0.9rem;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .ticket-grid {
            max-height: 220px;
            overflow-y: auto;
            padding-right: 2px;
        }

        .ticket-grid::-webkit-scrollbar { width: 5px; }
        .ticket-grid::-webkit-scrollbar-track { background: #f1f1f1; }
        .ticket-grid::-webkit-scrollbar-thumb { background: #cbd5e0; border-radius: 10px; }

        .ticket-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 12px;
            background: var(--background-light);
            border-radius: 8px;
            margin-bottom: 6px;
            cursor: pointer;
            border: 1px solid transparent;
            transition: all 0.2s;
        }
        
        .ticket-item.selected { 
            background: var(--light-green); 
            border-color: var(--primary-color); 
        }

        .ticket-number {
            font-weight: 700;
            font-size: 0.9rem;
            color: #1a202c;
        }

        .ticket-checkbox { 
            width: 16px; 
            height: 16px; 
            accent-color: var(--primary-color); 
        }

        .summary-box {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #f7fafc;
            padding: 12px 14px;
            border-radius: 10px;
            margin-bottom: 16px;
            border: 1px solid var(--card-border);
        }

        .summary-text { font-size: 0.85rem; color: #4a5568; font-weight: 600; }
        .total-amount { font-size: 1.2rem; font-weight: 800; color: #1a202c; }

        .payment-gateway-box {
            background: #fffdf5;
            border: 2px solid #fbd38d;
            border-radius: 14px;
            padding: 16px;
            margin-bottom: 16px;
            text-align: center;
            display: none;
        }

        .payment-title {
            font-size: 0.9rem;
            font-weight: 700;
            color: #b7791f;
            margin-bottom: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
        }

        .qr-code-wrapper {
            background: #ffffff;
            padding: 10px;
            display: inline-block;
            border-radius: 8px;
            border: 1px solid #e2e8f0;
            margin-bottom: 12px;
        }

        .qr-code-wrapper img {
            width: 150px;
            height: 150px;
            display: block;
        }

        .btn-pay-app {
            width: 100%;
            background: #3182ce;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 8px;
            font-weight: 700;
            font-size: 0.85rem;
            cursor: pointer;
            margin-bottom: 6px;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 6px;
        }

        .btn-pay-app:hover { background: #2b6cb0; }

        .payment-notice {
            font-size: 0.75rem;
            color: #718096;
            font-weight: 500;
        }

        .btn-submit { 
            width: 100%; 
            background: var(--primary-color); 
            color: #ffffff; 
            border: none; 
            padding: 14px; 
            font-size: 0.95rem; 
            font-weight: 700; 
            border-radius: 12px; 
            cursor: pointer; 
            display: flex; 
            justify-content: center; 
            align-items: center; 
            gap: 6px; 
            box-shadow: 0 4px 12px rgba(0, 135, 68, 0.25); 
        } 

        .btn-submit:hover { background: var(--secondary-color); } 

        .gov-footer-text { 
            text-align: center; 
            font-size: 0.7rem; 
            color: #a0aec0; 
            margin-top: 12px; 
            font-weight: 600; 
            text-transform: uppercase; 
            letter-spacing: 0.5px; 
        } 

        @keyframes tiktik { 
            0% { opacity: 0.2; } 
            100% { opacity: 1; } 
        } 

        @keyframes pulseEffect { 
            0% { transform: scale(1); } 
            50% { transform: scale(1.02); } 
            100% { transform: scale(1); } 
        } 
    </style>
</head> 
<body> 

<div class="phone-container"> 
    <div class="gov-header"> 
        <h1>Kerala Lottery</h1> 
        <div class="gov-sub-tag">Official Online Counter</div> 
    </div> 
 
    <div class="hero-banner-wrapper"> 
        <div class="booking-alert-box" id="live-booking-box"> 
            <div class="ticket-icon-circle">🎟️</div> 
            <div class="booking-details-text"> 
                <div class="booking-user-line"> 
                    <strong id="user-name">Vikram</strong> se <span id="user-state" style="color: #008744; font-weight: 700;">Bihar</span> 
                </div> 
                <div class="booking-stats-line"> 
                    Booked <span id="user-tickets" style="font-weight:700; margin:0 3px;">8</span> Tickets  
                    <span class="amount-paid" id="user-payment">₹1192 Paid</span> 
                </div> 
            </div> 
        </div> 

        <div class="live-draw-box"> 
            <div style="display: flex; align-items: center;"> 
                <div class="live-badge"> 
                    <div class="ticker-dot"></div> LIVE 
                </div> 
                <span class="draw-title">Today's Result:</span> 
            </div> 
            <div class="ticker-text" id="live-draw-number">KL3849102</div> 
        </div> 
    </div> 

    <div class="status-bar"> 
        <span>● Online Ticket Counter</span> 
        <span>● Direct Live result</span> 
    </div> 

    <form class="form-body" id="lotteryForm" onsubmit="sendToWhatsApp(event)"> 
        <div class="form-group"> 
            <label for="fullName">Full Name</label> 
            <div class="input-wrapper"> 
                <span class="icon">👤</span> 
                <input type="text" id="fullName" placeholder="Enter your name" required> 
            </div> 
        </div> 

        <div class="form-group"> 
            <label for="mobileNumber">WhatsApp Number</label> 
            <div class="input-wrapper"> 
                <span class="icon">📞</span> 
                <input type="tel" id="mobileNumber" placeholder="Enter mobile number" pattern="[0-9]{10}" title="Please enter 10 digit number" required> 
            </div> 
        </div> 

        <div class="ticket-container"> 
            <div class="ticket-title">🎟️ Choose Live Ticket Numbers:</div> 
            <div class="ticket-grid" id="ticketGrid"></div> 
        </div> 

        <div class="summary-box"> 
            <div class="summary-text">Selected: <span id="selectedCount" style="font-weight:700; color:var(--primary-color);">0</span> Ticket(s)</div> 
            <div class="total-amount">Amount: ₹<span id="totalPrice">0</span></div> 
        </div> 

        <div class="payment-gateway-box" id="paymentGateway">
            <div class="payment-title">⚡ Instant Secure UPI Payment</div>
            <div class="qr-code-wrapper">
                <img id="dynamicQrCode" src="" alt="Scan to Pay">
            </div>
            <button type="button" class="btn-pay-app" onclick="openDirectUpiPay()">
                📱 Pay via Mobile UPI Apps
            </button>
            <div class="payment-notice">Scan QR Code or Click above button to pay ₹<span id="paymentNoticeAmount">0</span></div>
        </div>

        <button type="submit" class="btn-submit"> 
            📲 Confirm Payment & Get Tickets 
        </button> 

        <div class="gov-footer-text"> 
            🛡️ Secure Server Connected 
        </div> 
    </form>
</div> 

<script> 
    const TICKET_PRICE = 149; 
    const WHATSAPP_NUMBER = "919709981588"; 
    const PAYEE_UPI_ID = "suresh277@fam";
    const MERCHANT_NAME = "Kerala Lottery Counter";
 
    const indiaStates = [ 
        "Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh",  
        "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jharkhand",  
        "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur",  
        "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Punjab",  
        "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura",  
        "Uttar Pradesh", "Uttarakhand", "West Bengal" 
    ]; 
     
    const customerNames = ["Vikram", "Rahul", "Anand", "Suresh", "Arjun", "Rajesh", "Akhil", "Deepak", "Manoj", "Pranav", "Sanjay", "Kiran", "Hari", "Amit", "Vijay", "Rohan", "Sunil", "Ravi", "Ajay", "Vinay"]; 
 
    // बिल्कुल अलग-अलग और रैंडम नंबर जेनरेट करने का सिस्टम
    function generateTrulyRandomTickets(count) {
        const list = [];
        while(list.length < count) {
            // 1000000 से 9999999 के बीच पूरी तरह से रैंडम 7 अंकों का नंबर
            let randomSevenDigits = Math.floor(1000000 + Math.random() * 9000000).toString();
            let fullTicket = "KL" + randomSevenDigits;
            
            // डुप्लिकेट रोकने के लिए चेक
            if (!list.includes(fullTicket)) {
                list.push(fullTicket);
            }
        }
        return list;
    }

    // ग्रिड के लिए 100 पूरी तरह से अलग-अलग टिकट नंबर बनाएं
    const exactUserTickets = generateTrulyRandomTickets(100); 
    const ticketGrid = document.getElementById('ticketGrid'); 
     
    exactUserTickets.forEach(ticketStr => { 
        const item = document.createElement('div'); 
        item.className = 'ticket-item'; 
        item.setAttribute('onclick', `toggleTicket(this, '${ticketStr}')`); 
 
        item.innerHTML = ` 
            <span class="ticket-number">★ ${ticketStr}</span> 
            <input type="checkbox" class="ticket-checkbox" value="${ticketStr}" onclick="event.stopPropagation(); updateCalculation();"> 
        `; 
        ticketGrid.appendChild(item); 
    }); 
 
    function toggleTicket(element, ticketNum) { 
        const checkbox = element.querySelector('.ticket-checkbox'); 
        checkbox.checked = !checkbox.checked; 
        element.classList.toggle('selected', checkbox.checked); 
        updateCalculation(); 
    } 
 
    let globalTotalAmount = 0;

    function updateCalculation() { 
        const checkboxes = document.querySelectorAll('.ticket-checkbox:checked'); 
        const selectedCount = checkboxes.length;
        globalTotalAmount = selectedCount * TICKET_PRICE;

        document.getElementById('selectedCount').innerText = selectedCount; 
        document.getElementById('totalPrice').innerText = globalTotalAmount; 

        const paymentGateway = document.getElementById('paymentGateway');
        
        if(globalTotalAmount > 0) {
            paymentGateway.style.display = "block";
            document.getElementById('paymentNoticeAmount').innerText = globalTotalAmount;
            
            const upiString = `upi://pay?pa=${PAYEE_UPI_ID}&pn=${encodeURIComponent(MERCHANT_NAME)}&am=${globalTotalAmount}&cu=INR`;
            document.getElementById('dynamicQrCode').src = `https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=${encodeURIComponent(upiString)}`;
        } else {
            paymentGateway.style.display = "none";
        }
    } 
 
    function openDirectUpiPay() {
        if(globalTotalAmount > 0) {
            const upiString = `upi://pay?pa=${PAYEE_UPI_ID}&pn=${encodeURIComponent(MERCHANT_NAME)}&am=${globalTotalAmount}&cu=INR`;
            window.location.href = upiString;
        }
    }

    const bookingBox = document.getElementById('live-booking-box'); 
    const nameEl = document.getElementById('user-name'); 
    const stateEl = document.getElementById('user-state'); 
    const ticketsEl = document.getElementById('user-tickets'); 
    const paymentEl = document.getElementById('user-payment'); 
    const liveDrawContainer = document.getElementById('live-draw-number'); 
 
    // लाइव रिफ्रेश में भी हमेशा रैंडम टिकट नंबर दिखेगा
    setInterval(() => { 
        bookingBox.style.animation = 'none'; 
        setTimeout(() => { bookingBox.style.animation = 'pulseEffect 0.5s ease-in-out'; }, 10); 
 
        const randomName = customerNames[Math.floor(Math.random() * customerNames.length)]; 
        const randomState = indiaStates[Math.floor(Math.random() * indiaStates.length)]; 
        const randomTicketsCount = Math.floor(Math.random() * 10) + 1;  
        const totalPaid = randomTicketsCount * TICKET_PRICE; 
 
        nameEl.innerText = randomName; 
        stateEl.innerText = randomState; 
        ticketsEl.innerText = randomTicketsCount; 
        paymentEl.innerText = `₹${totalPaid} Paid`; 
 
        // लाइव टिकर के लिए रैंडम 7 डिजिट नंबर जेनरेट करें
        let liveRandomDigits = Math.floor(1000000 + Math.random() * 9000000).toString();
        liveDrawContainer.innerText = "KL" + liveRandomDigits; 
    }, 3500); 
 
    function sendToWhatsApp(event) { 
        event.preventDefault(); 
        const name = document.getElementById('fullName').value; 
        const mobile = document.getElementById('mobileNumber').value; 
         
        let selectedTickets = []; 
        const activeCheckboxes = document.querySelectorAll('.ticket-checkbox:checked'); 
        activeCheckboxes.forEach(cb => selectedTickets.push(cb.value)); 
 
        if (selectedTickets.length === 0) {
            alert("Please select at least one ticket to initiate payment!");
            return;
        }

        const message = `Hello, I have processed the payment.\n\n📝 *Booking Details*:\n• Name: ${name}\n• Mobile: ${mobile}\n• Tickets Picked: ${selectedTickets.join(', ')}\n• Total Amount Paid: ₹${globalTotalAmount}\n\n⚡ *Payment Status*: Success via Auto UPI Gateway`;
        window.open(`https://api.whatsapp.com/send?phone=${WHATSAPP_NUMBER}&text=${encodeURIComponent(message)}`, '_blank');
    } 
</script> 
</body> 
</html>
