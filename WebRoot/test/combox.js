Ext.onReady(function () {
            //初始化标签中的Ext:Qtip属性。
            Ext.QuickTips.init();
            Ext.form.Field.prototype.msgTarget = 'side';

            //----------------------下拉列表开始----------------------//
            //创建市数据源
            var combocitystore = new Ext.data.Store({
                //设定读取的地址
                proxy: new Ext.data.HttpProxy({ url: '/App_Ashx/Demo/City.ashx' }),
                //设定读取的格式    
                reader: new Ext.data.JsonReader({ root: 'data' },
                 [{ name: 'id' }, { name: 'name'}])
            });
            //创建区数据源
            var comboareastore = new Ext.data.Store({
                //设定读取的地址
                proxy: new Ext.data.HttpProxy({ url: '/App_Ashx/Demo/Area.ashx' }),
                reader: new Ext.data.JsonReader({ root: 'data' },
                 [{ name: 'id' }, { name: 'name'}])
            });
            //创建市Combobox
            var comboboxcity = new Ext.form.ComboBox({
                id: 'comboboxcity',
                fieldLabel: '市',
                width: 120,
                store: combocitystore,
                displayField: 'name',
                valueField: 'id',
                triggerAction: 'all',
                emptyText: '请选择...',
                allowBlank: false,
                blankText: '请选择市',
                editable: false,
                mode: 'local', //该属性和以下方法为了兼容ie8
                listeners: {
                    'render': function () {
                        combocitystore.load();
                    }
                }
            });

            //创建区Combobox
            var comboareacity = new Ext.form.ComboBox({
                fieldLabel: '区',
                width: 120,
                store: comboareastore,
                displayField: 'name',
                valueField: 'id',
                triggerAction: 'all',
                emptyText: '请选择...',
                allowBlank: false,
                blankText: '请选择区',
                editable: false
            });
            //联动的实现
            comboboxcity.on('select', function () {
                comboareastore.baseParams.id = comboboxcity.getValue();
                comboareacity.setValue('');
                comboareastore.load();
            })
            //----------------------下拉列表结束----------------------//
            //表单
            var form = new Ext.form.FormPanel({
                frame: true,
                title: '表单标题',
              //如果要做成表格样式的，就需要layout‘table’的格式配置//
                layout: 'table',
                style: 'margin:10px',
                layoutConfig: {
    				columns: 2
    			},
    			defaults: {
    				labelWidth: 60,
    				labelAlign: 'right'
    			},
                items: [{
    				width: 200,
    				layout: 'form',
    				items: [{
    					xtype: 'textfield',
    					fieldLabel: '标题',
    					allowBlank: false,
    					emptyText: '不能为空',
    					blankText: '不能为空',
    					width: 100,
    					name: 'train.trainTitle'
    				},{
    					xtype: 'datefield',
    					fieldLabel: '时间',
    					allowBlank: false,
    					emptyText: '不能为空',
    					blankText: '不能为空',
    					width: 100,
    					name: 'train.trainDate',
    					format: 'Y-m-d'
    				}]
    			},{
                	width: 200,
    				layout: 'form',
    				items: [comboboxcity,comboareacity]
                },{
        				width: 200,
        				layout: 'form',
        				items: [{
        					xtype: 'textfield',
        					fieldLabel: '标题',
        					allowBlank: false,
        					emptyText: '不能为空',
        					blankText: '不能为空',
        					width: 100,
        					name: 'train.trainTitle'
        				},{
        					xtype: 'datefield',
        					fieldLabel: '时间',
        					allowBlank: false,
        					emptyText: '不能为空',
        					blankText: '不能为空',
        					width: 100,
        					name: 'train.trainDate',
        					format: 'Y-m-d'
        				}]
        			},{
                    	width: 200,
        				layout: 'form',
        				items: [comboboxcity,comboareacity]
                }]
            });
            //窗体
            var win = new Ext.Window({
                title: '窗口',
                width: 476,
                height: 374,
                resizable: true,
                modal: true,
                closable: true,
                maximizable: true,
                minimizable: true,
                buttonAlign: 'center',
                items: form
            });
            win.show();
        });