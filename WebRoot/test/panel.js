Ext.onReady(function(){
	Ext.QuickTips.init();
	Ext.form.Field.prototype.msgTarget='side';
	var txtusername=new Ext.form.TextField({
		width:140,
		allowBlank:false,
		maxLength:20,
		name:'username',
		fieldLabel:'用户名',
		blankText:'请输入用户名',
		maxLengthText:'用户名不能超过20个字符'
	});
	var txtpassword=new Ext.form.TextField({
		width:140,
		allowBlank:false,
		maxLength:20,
		inputType:'password',
		name:'password',
		fieldLabel:'密     码',
		blankText:'请输入密码',
		maxLengthText:'密码不能超过20个字符'
	});
	var txtcheckcode=new Ext.form.TextField({
		fieldLabel:'验证码',
		id:'checkcode',
		allowBlank:false,
		width:76,
		blankText:'请输入验证码!',
		maxLength:4,
		maxLengthText:'验证码不能超过4个字符!'
	});
	var btnsubmitclick=function(){
		if(form.getForm().isValid()){
			Ext.Msg.alert("提示","登陆成功！");
		}
	}
	var btnresetclick=function(){
		form.getForm().reset();
	}
	var btnresetmouseover=function(){
		Ext.MessageBox.alert('提示','你的鼠标悬停在重置按钮之上！');
	}
	var btnsubmit=new Ext.Button({
		text:'提交',
		handler:btnsubmitclick
	});
	var btnreset=new Ext.Button({
		text:'重置',
		handler:btnresetclick
	});
	var form=new Ext.form.FormPanel({
		url:'',
		labelAlign:'left',
		labelWidth:55,
		frame:true,
		title:'表单标题',
		cls:'loginform',
		buttonAlign:'center',
		bodyStyle:'padding:6px 0px 0px 15px',
		items:[txtusername,txtpassword,txtcheckcode],
		buttons:[btnsubmit,btnreset]
	});
	var win=new Ext.Window({
		title:'用户登录',
		iconCls:'loginicon',
		plain:true,
		width:276,
		height:174,
		resizable:true,
		modal:true,
		closable:true,
		maximizable:true,
		minimizable:true,
		items:form
	});
	win.show();
	var checkcode=Ext.getDom('checkcode');
	var checkimage=Ext.get(checkcode.parentNode);
	checkimage.createChild({
		tag:'img',
		src:'image/checkcode.gif',
		align:'absbottom',
		style:'padding-left:23px;cursor:pointer;'
	})
});