// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title یک نمونه قرارداد ERC-20 برای ایجاد توکن سفارشی
/// @dev پیاده‌سازی استاندارد ERC-20 با قابلیت‌های اصلی و رویدادها
contract MyToken {
    
    // **نام و نماد توکن** (مثلاً نام "MyToken" و نماد "MTK")
    string public name = "MyToken";
    string public symbol = "MTK";

    // **تعداد ارقام اعشار**: استاندارد ERC-20 معمولاً 18 رقم اعشار برای سازگاری بهتر با ETH دارد.
    uint8 public decimals = 18;

    // **عرضه کل**: تعداد کل توکن‌هایی که ایجاد شده‌اند (بر حسب کوچک‌ترین واحد).
    uint256 public totalSupply;

    // **آدرس مالک قرارداد**: برای مدیریت دسترسی‌ها (مانند تغییرات احتمالی).
    address public owner;

    // **موجودی هر آدرس**: این نقشه (mapping) برای ذخیره‌سازی موجودی هر آدرس استفاده می‌شود.
    mapping(address => uint256) public balanceOf;

    // **مقدار مجاز (allowance)**: این نقشه برای مدیریت مجوزهای خرج‌کردن از طرف دیگران استفاده می‌شود.
    mapping(address => mapping(address => uint256)) public allowance;

    // **رویدادها (Events)**: این رویدادها برای ثبت عملیات‌ها روی بلاک‌چین به کار می‌روند.
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /// @notice سازنده قرارداد (Constructor) که در زمان استقرار (Deployment) اجرا می‌شود.
    /// @param initialSupply عرضه اولیه توکن که به مالک (deployer) تخصیص داده می‌شود.
    constructor(uint256 initialSupply) {
        // تنظیم عرضه کل و تخصیص موجودی اولیه به مالک قرارداد
        totalSupply = initialSupply * (10 ** uint256(decimals));
        balanceOf[msg.sender] = totalSupply;
        owner = msg.sender;
        
        // انتقال عرضه اولیه به آدرس مالک و ثبت در رویداد
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    /// @notice انتقال توکن از پیام‌دهنده به آدرس گیرنده
    /// @param to آدرس گیرنده
    /// @param value مقدار توکن برای انتقال
    /// @return موفقیت انتقال (true)
    function transfer(address to, uint256 value) public returns (bool success) {
        require(balanceOf[msg.sender] >= value, "موجودی کافی نیست");
        _transfer(msg.sender, to, value);
        return true;
    }

    /// @notice انتقال توکن از یک آدرس مشخص به آدرس دیگر (در صورت داشتن مجوز)
    /// @param from آدرس فرستنده
    /// @param to آدرس گیرنده
    /// @param value مقدار توکن برای انتقال
    /// @return موفقیت انتقال (true)
    function transferFrom(address from, address to, uint256 value) public returns (bool success) {
        require(balanceOf[from] >= value, "موجودی فرستنده کافی نیست");
        require(allowance[from][msg.sender] >= value, "مقدار مجاز کافی نیست");

        // کاهش مقدار مجاز پس از استفاده
        allowance[from][msg.sender] -= value;
        _transfer(from, to, value);
        return true;
    }

    /// @notice تایید خرج‌کردن توکن‌ها توسط یک آدرس مشخص
    /// @param spender آدرسی که مجوز دریافت می‌کند
    /// @param value مقدار مجاز توکن برای خرج‌کردن
    /// @return موفقیت عملیات (true)
    function approve(address spender, uint256 value) public returns (bool success) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    /// @dev تابع داخلی برای انجام انتقال و ثبت رویداد
    /// @param from آدرس فرستنده
    /// @param to آدرس گیرنده
    /// @param value مقدار توکن برای انتقال
    function _transfer(address from, address to, uint256 value) internal {
        require(to != address(0), "آدرس گیرنده نمی‌تواند صفر باشد");
        
        // به‌روزرسانی موجودی‌ها
        balanceOf[from] -= value;
        balanceOf[to] += value;

        // ثبت رویداد انتقال
        emit Transfer(from, to, value);
    }

    /// @notice بررسی موجودی یک آدرس (برای سهولت در دسترسی عمومی)
    /// @param account آدرس مورد نظر
    /// @return مقدار موجودی آدرس
    function getBalance(address account) public view returns (uint256) {
        return balanceOf[account];
    }
}
