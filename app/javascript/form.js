$(function(){
	// nameフォーム
	$("#textbox_name").bind("blur", function() {
		var _textbox_name = $(this).val();
		check_textbox_name(_textbox_name, data);
	});
	
	// emailフォーム
	$.ajax({
		type: 'GET',
		url: "/sign_up",
		dataType: "json"
	})
	.done(function(data){
		$("#textbox_email").bind("blur", function() {
			var _textbox_email = $(this).val();
			check_textbox_email(_textbox_email,data);
		});
	})
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
function check_textbox_email(_textbox_email, _data){
	$("#err_textbox_email p").remove();
	var _result_email = true;
	var _textbox_email = $.trim(_textbox_email);

	if(_textbox_email.match(/[\w\-\._]+@[\w\-\._]+\.[A-Za-z]+/)){
		if(_data.indexOf(_textbox_email >= 0)){
		}
		else{
			$("#err_textbox_email").append('<p style="color: red;"><i class=\"fa fa-exclamation-triangle\"></i>使用されているメールアドレスです</p>');
		}
	}
	else {
		$("#err_textbox_email").append('<p style="color: red;"><i class=\"fa fa-exclamation-triangle\"></i>メールアドレスが無効です</p>');
		_result_email = false;
	}
	return _result_email;
}

