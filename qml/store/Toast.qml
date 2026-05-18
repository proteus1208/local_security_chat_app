pragma Singleton
import QtQuick

QtObject {
    property int counter: 0

    property ListModel toasts: ListModel {}

    function show(icon, title, text, duration) {
        var id = counter++;

        toasts.append({
            id: id,
            title: title,
            text: text,
            icon: (icon == "success") ? "../assets/icons/check.png" : icon == "error" ? "../assets/icons/error.png" : icon == "warn" ? "../assets/icons/warn.png" : icon,
            duration: duration || 3000
        });
    }

    function remove(id) {
        for (var i = 0, l = toasts.count; i < l; i++) {
            if (toasts.get(i).id === id) {
                toasts.remove(i);
                return;
            }
        }
    }

    function success(title, text) {
        show("success", title, text, 5000);
    }

    function error(title, text) {
        show("error", title, text, 4000);
    }

    function warn(title, text) {
        show("warn", title, text, 4000);
    }
}
