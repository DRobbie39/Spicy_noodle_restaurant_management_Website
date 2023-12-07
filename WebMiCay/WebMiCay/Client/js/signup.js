var inputUsernameRegister = document.querySelector(".input-signup-username");
var inputPasswordRegister = document.querySelector(".input-signup-password");
var inputPhone = document.querySelector(".input-signup-phone");
var inputMail = document.querySelector(".input-signup-mail");
var btnRegister = document.querySelector(".signup_signInButton");

// validation form register and register user local storage

btnRegister.addEventListener("click", (e) => {
    if (inputUsernameRegister.value === "" ||
        inputPasswordRegister.value === "" ||
        inputPhone.value === "" ||
        inputMail.value === "" 
    ) {
        alert("Không được để trống");
    }
    else if (!/(84|0[3|5|7|8|9])+([0-9]{8})\b/.test(inputPhone.value)) {
        alert("Sdt không đúng định dạng");
    }
    else if (!/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g.test(inputMail.value)) {
        alert("Mail không đúng định dạng");
    }
    else if (!/^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s\W|_]+$/.test(inputUsernameRegister.value)) {
        alert("Tên không hợp lệ");
    }
    else if (!/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/gm.test(inputPasswordRegister.value)) {
        alert("Mật khẩu không hợp lệ");
    }
    else {
        // array user
        const user = {
            username: inputMail.value,
            password: inputPasswordRegister.value,
        };
        let json = JSON.stringify(user);
        localStorage.setItem(inputUsernameRegister.value, json);
        alert("Đăng Ký Thành Công");
        window.location.href = "~/Home/Login";
    }
});