var ckeditor_config = {
	resize_enaleb : false,
	enterMode : CKEDITOR.ENTER_BR, 
	shiftEnterMode : CKEDITOR.ENTER_P,
	filebrowserUploadUrl : "/admin/goods/ckUpload"
}
CKEDITOR.replace("gdsDes", ckeditor_config);