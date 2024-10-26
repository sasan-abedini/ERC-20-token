### README for ERC-20 Token Contract  

---

## English  

### MyToken ERC-20 Smart Contract  

This repository contains a complete implementation of an **ERC-20 token smart contract** on the Ethereum blockchain. This contract provides essential token functionality, including transfers, approvals, and allowances, with comments to help developers understand the code.  

### Features  
- **Transfer Tokens**: Users can transfer tokens to other addresses.  
- **Allowance System**: Approve others to spend tokens on your behalf.  
- **Total Supply Management**: Predefined supply assigned to the contract owner.  
- **Events**: Record token transfers and approvals on the blockchain.  

### How to Deploy  
1. Open **Remix IDE** or use **Hardhat** for local deployment.  
2. Copy the contract code from `MyToken.sol`.  
3. Set the initial supply during deployment.  
4. Interact with the deployed contract using `transfer`, `approve`, and `transferFrom` functions.

### Example Usage  
```javascript
// Transfer 100 tokens to an address
await contract.transfer("0xRecipientAddress", 100);

// Approve another address to spend 50 tokens
await contract.approve("0xSpenderAddress", 50);

// Use transferFrom to move tokens from one address to another
await contract.transferFrom("0xOwnerAddress", "0xRecipientAddress", 50);
```

---

## فارسی  

### قرارداد هوشمند MyToken ERC-20  

این مخزن شامل پیاده‌سازی کامل یک **قرارداد هوشمند توکن ERC-20** روی بلاک‌چین اتریوم است. این قرارداد عملکردهای اساسی توکن مانند انتقال، تاییدیه و مجوز را فراهم می‌کند و با توضیحات کامل، به توسعه‌دهندگان کمک می‌کند تا کد را درک کنند.  

### ویژگی‌ها  
- **انتقال توکن**: کاربران می‌توانند توکن‌ها را به دیگران انتقال دهند.  
- **سیستم مجوز**: به دیگران اجازه خرج‌کردن توکن‌های خود را بدهید.  
- **مدیریت عرضه کل**: عرضه اولیه به مالک قرارداد تخصیص داده می‌شود.  
- **رویدادها**: ثبت انتقالات و تاییدیه‌ها روی بلاک‌چین.  

### نحوه استقرار  
1. از **Remix IDE** یا **Hardhat** برای استقرار قرارداد استفاده کنید.  
2. کد قرارداد را از `MyToken.sol` کپی کنید.  
3. عرضه اولیه را در زمان استقرار تنظیم کنید.  
4. از توابع `transfer`، `approve` و `transferFrom` برای تعامل با قرارداد استفاده کنید.  

### نمونه استفاده  
```javascript
// انتقال 100 توکن به یک آدرس
await contract.transfer("0xRecipientAddress", 100);

// تایید یک آدرس برای خرج‌کردن 50 توکن
await contract.approve("0xSpenderAddress", 50);

// استفاده از transferFrom برای انتقال توکن از یک آدرس به آدرس دیگر
await contract.transferFrom("0xOwnerAddress", "0xRecipientAddress", 50);
```

---

## Türkçe  

### MyToken ERC-20 Akıllı Sözleşmesi  

Bu depo, Ethereum blok zincirinde bir **ERC-20 token akıllı sözleşmesinin** tam uygulamasını içerir. Bu sözleşme, transferler, onaylar ve izinler gibi temel token işlevselliğini sağlar ve geliştiricilere kodu anlamalarına yardımcı olmak için açıklamalar içerir.  

### Özellikler  
- **Token Transferi**: Kullanıcılar tokenları diğer adreslere aktarabilir.  
- **İzin Sistemi**: Başkalarına sizin adınıza token harcama izni verin.  
- **Toplam Arz Yönetimi**: İlk arz, sözleşme sahibine tahsis edilir.  
- **Etkinlikler**: Token transferleri ve onaylar blok zincirine kaydedilir.  

### Nasıl Yüklenir  
1. **Remix IDE** veya **Hardhat** kullanarak sözleşmeyi dağıtın.  
2. Sözleşme kodunu `MyToken.sol` dosyasından kopyalayın.  
3. Dağıtım sırasında ilk arzı ayarlayın.  
4. Sözleşme ile `transfer`, `approve` ve `transferFrom` işlevlerini kullanarak etkileşim kurun.  

### Örnek Kullanım  
```javascript
// Bir adrese 100 token transferi yap
await contract.transfer("0xRecipientAddress", 100);

// Başka bir adrese 50 token harcama izni ver
await contract.approve("0xSpenderAddress", 50);

// transferFrom kullanarak bir adresten diğerine token taşı
await contract.transferFrom("0xOwnerAddress", "0xRecipientAddress", 50);
```

---

