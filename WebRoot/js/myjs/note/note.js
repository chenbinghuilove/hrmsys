NotePanel = Ext.extend(Ext.Panel,{
	id: 'notePanelId',
	constructor: function(){
		noteQueryPanel = new NoteQueryPanel();
		noteInfoGridPanel = new NoteInfoGridPanel();
		NotePanel.superclass.constructor.call(this,{
			style: 'margin:0 auto',
			border: false,
			//layout: 'fit',
			//autoWidth: true,
			//autorHeight: true,
			items: [noteQueryPanel, noteInfoGridPanel]
		})
	}
})