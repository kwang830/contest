/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	
	config.filebrowserUploadUrl = '/contextRoot/ckupload';

	config.toolbar = [
	          		{ name: 'document', items: [ 'Source', '-', 'NewPage'] },
	          		{ name: 'clipboard', items: [ 'Cut', 'Copy', '-', 'Undo', 'Redo' ] },
	          		{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'CopyFormatting', 'RemoveFormat' ] },
	          		{ name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl' ] },
	          		{ name: 'links', items: [ 'Link', 'Unlink'] },
	          		{ name: 'insert', items: [ 'Image', 'Table', 'HorizontalRule', 'SpecialChar', 'Iframe' ] },
	          		{ name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
	          		{ name: 'colors', items: [ 'TextColor', 'BGColor' ] },


	          	];
	
	/*
	config.toolbarGroups = [
	                		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
	                		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
	                		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
	                		{ name: 'forms', groups: [ 'forms' ] },
	                		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
	                		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
	                		{ name: 'links', groups: [ 'links' ] },
	                		{ name: 'insert', groups: [ 'insert' ] },
	                		{ name: 'styles', groups: [ 'styles' ] },
	                		{ name: 'colors', groups: [ 'colors' ] },
	                		{ name: 'tools', groups: [ 'tools' ] },
	                		{ name: 'others', groups: [ 'others' ] },
	                		{ name: 'about', groups: [ 'about' ] }
	                	];
	*/
	//config.removeButtons = 'Save,Templates,NewPage,Preview,Print,Cut,Copy,Paste,PasteText,PasteFromWord,SelectAll,Find,Replace,Scayt,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,NumberedList,BulletedList,Outdent,Indent,CreateDiv,Blockquote,BidiLtr,BidiRtl,Language,Link,Image,Unlink,Flash,Anchor,HorizontalRule,Table,Smiley,SpecialChar,PageBreak,Iframe,Maximize,ShowBlocks,About';

};
