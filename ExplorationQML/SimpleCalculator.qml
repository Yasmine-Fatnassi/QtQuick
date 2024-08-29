// SimpleCalculator.qml
import QtQuick 2.15

Item {
    property int result: 0

    function add(a, b) {
        result = a + b;
        return result;
    }

    function subtract(a, b) {
        result = a - b;
        return result;
    }
}
