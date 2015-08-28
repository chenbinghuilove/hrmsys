/**
 * 日志信息表格
 * @author sux 2011-02-20
 * @memberOf {TypeName} 
 */
NoteInfoGridPanel = Ext.extend(Ext.grid.GridPanel,{
	id: 'noteInfoGridId',
	constructor: function(){
		Ext.QuickTips.init();
		var sm = new Ext.grid.CheckboxSelectionModel();
		var number = new Ext.grid.RowNumberer();
		var cm = new Ext.grid.ColumnModel([
			number, sm,
		{
			header: '日志编号',
			dataIndex: 'noteId',
			align: 'center'
		},{
			header: '用户名',
			dataIndex: 'noteAddPerson',
			align: 'center'
		},{
			header: '完成时间',
			dataIndex: 'notefinishDate',
			align: 'center'
		},{
			header: '日志内容',
			dataIndex: 'noteContent',
			align: 'center'
		},{
			header: '工时信息',
			dataIndex: 'noteHours',
			align: 'center'
		}]);
		var noteStore = new Ext.data.JsonStore({
			url: 'note_list.action',
			root: 'root',
 			totalProperty: 'totalProperty',
			fields: ['noteId','noteAddPerson','notefinishDate','noteContent','noteHours']
		});
		TrainInfoGridPanel.superclass.constructor.call(this, {
			width: Ext.getCmp('mainTab').getActiveTab().getInnerWidth(),
			height: Ext.getCmp('mainTab').getActiveTab().getInnerHeight(),
			/**表格高度自适应 document.body.clientHeight浏览器页面高度 start**/
			monitorResize: true, 
			doLayout: function() { 
				this.setWidth(document.body.clientWidth-205);
				this.setHeight(document.body.clientHeight-250);
				Ext.grid.GridPanel.prototype.doLayout.call(this); 
			} ,
			viewConfig: {
				forceFit: true,
				autoFill: true,
				columnsText : "显示/隐藏列",
                sortAscText : "正序排列",
                sortDescText : "倒序排列"
			},
			border: false,
			height: 500,
			frame: true,
			cm: cm,
			sm: sm,
			store: noteStore,
			tbar: new Ext.Toolbar({
				items: [{
					text: '显示全部',
					iconCls: 'all',
					handler: function(){
						noteStore.load();
					}
				},{
					text: '删除',
					iconCls: 'delete',
					id: 'note_delete',
					hidden: 'true',
					handler: delNoteFn
				},{
					text: '添加',
					iconCls: 'add',
					id: 'note_add',
					hidden: 'true',
					handler: addNoteFn
				},{
					text: '修改',
					iconCls: 'update',
					id: 'note_update',
					hidden: 'true',
					handler: editNoteFn
				},{
					text: '详情',
					iconCls: 'detail',
					id: 'note_detail',
					hidden: 'true',
					handler: detailNoteFn
				}]
			}),
			bbar: new PagingToolbar(noteStore,20)
		});
		noteStore.load({
			params: {
				start: 0,
				limit: 20
			}
		});
	}
});
delNoteFn = function(){
	gridDel('noteInfoGridId','noteId','note_delete.action');
};
addNoteFn = function(){
	var noteAddWin = new NoteAddWin();
	noteAddWin.show();
};
detailNoteFn = function(){
	var noteDetailWin = new NoteDetailWin();
	noteDetailWin.title = '日志填报';
	var selectionModel = Ext.getCmp('noteInfoGridId').getSelectionModel();
	var record = selectionModel.getSelections();
	if(record.length != 1){
		Ext.Msg.alert('提示','请选择一个');
		return;
	}
	var trainId = record[0].get('noteId');
	Ext.getCmp('noteDetailPanelId').getForm().load({
		url: 'note_intoUpdate.action',
		params: {
			noteId: noteId
		}
	})
	noteDetailWin.show();
};
editNoteFn = function(){
	var noteAddWin = new NoteAddWin();
	noteAddWin.title = '招聘信息修改';
	var selectionModel = Ext.getCmp('noteInfoGridId').getSelectionModel();
	var record = selectionModel.getSelections();
	if(record.length != 1){
		Ext.Msg.alert('提示','请选择一个');
		return;
	}
	var noteId = record[0].get('noteId');
	Ext.getCmp('noteAddPanelId').getForm().load({
		url: 'note_intoUpdate.action',
		params: {
			trainId: noteId
		}
	})
	noteAddWin.show();
};
/**
 * 按条件查询面板
 * @author sux 2011-02-20
 * @memberOf {TypeName} 
 */
var NoteQueryPanel = Ext.extend(Ext.Panel,{
	id: 'noteQueryId',
	constructor: function(){
		NoteQueryPanel.superclass.constructor.call(this,{
			collapsible: true,
			titleCollapse: true, //单击整个collapse都有效
			//collapsed: true, //渲染后即闭合
			title: '条件查询',
			border: false,
			frame: true,
			autoWidth: true,
			defaultType: 'fieldset',
			items: [{
				title: '查询条件',
				layout: 'table',
				layoutConfig: {
					columns: 6
				},
				defaults: {
					labelWidth: 60,
					labelAlign: 'right'
				},
				items: [{
					layout: 'form',
					items: [{
						xtype: 'textfield',
						fieldLabel: '用户名',
						width: 100,
						id: 'note_addperson'
					}]
				},{
					layout: 'form',
					items: [{
						xtype: 'datefield',
						fieldLabel: '开始时间',
						format: 'Y-m-d',
						width: 100,
						id: 'start_date'
					}]
				},{
					layout: 'form',
					items: [{
						xtype: 'datefield',
						fieldLabel: '结束时间',
						format: 'Y-m-d',
						width: 100,
						id: 'end_date'
					}]
				},{
					style: 'margin: 0px 10px 0px 20px;',
					xtype: 'button',
					text: '查询',
					iconCls: 'search',
					handler: queryNoteFn
				},{
					xtype: 'button',
					text: '取消',
					iconCls:'cancel',
					handler: cancelNoteFn
				}]
			}]
		})
	}
});

queryNoteFn = function(){
	var noteAddPerson = Ext.get("note_addperson").dom.value;
	var startDate = Ext.get("start_date").dom.value;
	var endDate = Ext.get("end_date").dom.value;
	Ext.getCmp('noteInfoGridId').getStore().load({
		params: {
			type: 'query',
			startDate: startDate,
			endDate: endDate,
			noteAddPerson: noteAddPerson,
			start: 0,
			limit: 20
		}
	})
};
cancelNoteFn = function(){
	Ext.get("note_addperson").dom.value = "";
	Ext.get("start_date").dom.value = "";
	Ext.get("end_date").dom.value = "";
};

