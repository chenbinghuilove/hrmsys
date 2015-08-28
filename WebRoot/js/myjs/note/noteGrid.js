NoteGridWin = Ext.extend(Ext.Window,{
	id: 'noteGridWinId',
	constructor: function(){
		var noteGridPanel = new NoteGridPanel();
		NoteGridWin.superclass.constructor.call(this, {
			width: 550,
			height: 350,
			resizable: false, //不能改变窗体大小 
			title: '培训信息',
			collapsible: true,
			modal: true,
			items: [noteGridPanel]
		})
	}
});

NoteGridPanel = Ext.extend(Ext.grid.GridPanel,{
	id: 'noteGridId',
	constructor: function(){
		Ext.QuickTips.init();
		var number = new Ext.grid.RowNumberer();
		var cm = new Ext.grid.ColumnModel([
			number,
		{
			header: '日志编号',
			dataIndex: 'noteId',
			align: 'center',
			renderer: this.renderFn
		},{
			header: '用户名',
			dataIndex: 'noteAddPerson',
			align: 'center',
			renderer: this.renderFn
		},{
			header: '完成时间',
			dataIndex: 'notefinishDate',
			align: 'center',
			renderer: this.renderFn
		},{
			header: '日志内容',
			dataIndex: 'noteContent',
			align: 'center',
			renderer: this.renderFn
		},{
			header: '工时信息',
			dataIndex: 'noteHours',
			align: 'center',
			renderer: this.renderFn
		}]);
		var trainStore = new Ext.data.JsonStore({
			url: 'note_list.action',
			root: 'root',
 			totalProperty: 'totalProperty',
			fields: ['noteId','noteAddPerson','notefinishDate','noteContent','noteHours']
		});
		NoteGridPanel.superclass.constructor.call(this, {
			viewConfig: {
				forceFit: true,
				autoFill: true,
				columnsText : "显示/隐藏列",
                sortAscText : "正序排列",
                sortDescText : "倒序排列"
			},
			border: false,
			height: 320,
			frame: true,
			cm: cm,
			store: trainStore,
			listeners:{"rowdblclick" : function(grid, rowIndex, e){
				    var rowdata = grid.getStore().getAt(rowIndex).data;
                   Ext.getDom('trainId').value = rowdata.trainId; 
                   Ext.getDom('title').value = rowdata.trainTitle;
                   Ext.getCmp('noteGridWinId').destroy();
                }
            },
			bbar: new PagingToolbar(trainStore,10)
		});
		trainStore.load({
			params: {
				start: 0,
				limit: 10
			}
		});
	},
	renderFn: function(value){
				return "<span ext:qtip= '双击选取'>" + value + "</span>";
			}
});