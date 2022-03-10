$(function(){
	// nameフォーム
	$("#textbox_name").bind("blur", function() {
		var _textbox_name = $(this).val();
		check_textbox_name(_textbox_name);
	});
	// emailフォーム
	$("#textbox_email").bind("blur", function() {
		var _textbox_email = $(this).val();
		check_textbox_email(_textbox_email);
	});
	// 企業名フォーム
	$("#textbox_company").bind("blur", function() {
		var _textbox_company = $(this).val();
		check_textbox_company(_textbox_company);
	});
	// パスワードフォーム
	$("#textbox_password").bind("blur", function() {
		var _textbox_password = $(this).val();
		check_textbox_password(_textbox_password);
	});
	// パスワード確認フォーム
	$("#textbox_password_confirmation").bind("blur", function() {
		var _textbox_password = $("#textbox_password").val();
		var _textbox_password_confirmation = $(this).val();
		check_textbox_password_confirmation(_textbox_password, _textbox_password_confirmation);
		console.log(_textbox_password);
	});
});


// nameフォーム
function check_textbox_name(str){
	$("#err_textbox_name p").remove();
	var _result_name = true;
	var _textbox_name = $.trim(str);

	if(_textbox_name.match(/^[ 　\r\n\t]*$/)){
		$("#err_textbox_name").append('<p style="color: red;"><i class=\"fa fa-exclamation-triangle\"></i>名前を入力してください</p>');
		_result_name = false;
	}
	return _result_name;
}

// emailフォーム
function check_textbox_email(_textbox_email){
	$("#err_textbox_email p").remove();
	var _result_email = true;
	var _textbox_email = $.trim(_textbox_email);
	var _email_arr = gon.email_arr;

	if(_textbox_email.match(/[\w\-\._]+@[\w\-\._]+\.[A-Za-z]+/)){
		if(_email_arr.indexOf(_textbox_email) >= 0){
			$("#err_textbox_email").append('<p style="color: red;"><i class=\"fa fa-exclamation-triangle\"></i>使用されているメールアドレスです</p>');
		}
	}
	else {
		$("#err_textbox_email").append('<p style="color: red;"><i class=\"fa fa-exclamation-triangle\"></i>メールアドレスが無効です</p>');
		_result_email = false;
	}
	return _result_email;
}

// 企業名フォーム
function check_textbox_company(str) {
	$("#err_textbox_company p").remove();
	var _result_company = true;
	var _textbox_company = $.trim(str);

	if(_textbox_company.match(/^[ 　\r\n\t]*$/)) {
		$("#err_textbox_company").append('<p style="color: red;"><i class=\"fa fa-exclamation-triangle\"></i>企業名を入力してください</p>');
		_result_company = false;
	}
	return _result_company;
}

// パスワードフォーム
function check_textbox_password(str) {
	$("#err_textbox_password p").remove();
	var _result_password = true;
	var _textbox_password = $.trim(str);
	if(_textbox_password.length > 11){
			if(_textbox_password.match(	/^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).*$/)) {
			}
			else {
				$("#err_textbox_password").append('<p style="color: red;"><i class=\"fa fa-exclamation-triangle\"></i>パスワードを英数字大文字小文字混合で入力してください</p>');
			}
	}
	else{
		$("#err_textbox_password").append('<p style="color: red;"><i class=\"fa fa-exclamation-triangle\"></i>パスワードを12文字以上で入力してください</p>');
		_result_password = false;
	}
	return _result_password;
}
// パスワード確認フォーム
function check_textbox_password_confirmation(password, comfirm) {
	$("#err_textbox_password_confirmation p").remove();
	var _result_password_confirmation = true;
	var _textbox_password = $.trim(password);
	var _textbox_password_confirmation = $.trim(comfirm);

	if(_textbox_password_confirmation !== _textbox_password){
		$("#err_textbox_password_confirmation").append('<p style="color: red;"><i class=\"fa fa-exclamation-triangle\"></i>パスワードが不一致です</p>');
	}
	return _result_password_confirmation;
}