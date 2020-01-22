Z8.define('org.zenframework.z8.template.Viewport', {
	extend: 'Z8.application.viewport.Viewport',

	createHeaderButtons: function() {
		var buttons = this.callParent();
		var login = User.login;
		var user = this.userButton = new Z8.button.Button({ text: login, tooltip: login, cls: 'btn-tool', icon: 'fa-user', enabled: false });
		return buttons.insert(user, 0);
	}
});