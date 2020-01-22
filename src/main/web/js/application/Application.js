Application.userCls = 'org.zenframework.z8.template.User';
Application.viewportCls = 'org.zenframework.z8.template.Viewport';

Z8.apply(Application.subclasses, {
});

Application.listbox.collapsed = false;
//Application.listbox.locks = false;
//Application.listbox.checks = false;

Application.name = 'Z8 Template';
Application.title = 'Z8 Template';

//Application.startupForm = function() {
//	return User.parameters.systemInstalled ? 'org.zenframework.z8.template.StartPage' : null;
//};
