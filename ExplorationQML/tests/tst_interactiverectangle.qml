import QtQuick 2.15
import QtTest
import ".." // Importer le composant à tester

Item {
    InteractiveRectangle {
        id: rect
        focus: true;
    }

    SignalSpy {
        id: clickspy;
        target: rect
        signalName: "keyPressed"
    }

    SignalSpy {
        id: mouseSpy;
        target: rect;
        signalName: "rectangleClicked"

    }

        TestCase {
        id: testCase
        name: "InteractiveRectangleTest"
        when: windowShown;


        function test_initialState() {
            compare(Qt.colorEqual(rect.color, "red"), true, "La couleur initiale doit être rouge")
        }

        function test_mouseClick() {
            mouseSpy.clear();
            compare(mouseSpy.count, 0, "Le mouseSpy ne doit pas voir reçu le signal avant le click");
            mouseClick(rect)
            compare(mouseSpy.count, 1, "Le signal 'rectangleClicked' devrait être émis après un clic")
            compare(Qt.colorEqual(rect.color, "green"), true, "La couleur doit être verte après un clic")
        }

        function test_keyClick() {
            clickspy.clear();
            compare(clickspy.count, 0, "Auncun click n'a été émis")
            keyClick(Qt.Key_B)
            compare(Qt.colorEqual(rect.color, "blue"), true, "La couleur doit être bleue après avoir appuyé sur la touche 'b'")
            compare(clickspy.count, 1, "Un seul click a été reçu")
            keyClick(Qt.Key_R)
            compare(Qt.colorEqual(rect.color, "red"), true, "La couleur doit revenir à rouge après avoir appuyé sur la touche 'r'")
            compare(clickspy.count, 2, "Les deux clicks ont été reçu")
        }

        function test_interaction_sequence(){
                clickspy.clear();
                mouseSpy.clear();
                compare(clickspy.count, 0, "Aucun click n'a été reçu sur le clavier");
                compare(mouseSpy.count, 0, "Aucun click n'a été reçu sur la souris");
                mouseClick(rect);
                compare(Qt.colorEqual(rect.color, "green"), true, "La couleur doit être verte après un clic")
                keyClick(Qt.Key_B);
                compare(Qt.colorEqual(rect.color, "blue"), true, "La couleur doit être bleue après avoir appuyé sur la touche 'b'")
                keyClick(Qt.Key_R)
                compare(Qt.colorEqual(rect.color, "red"), true, "La couleur doit revenir à rouge après avoir appuyé sur la touche 'r'")
                compare(clickspy.count, 2, "Deux clics doivent avoir été enregistrés");
                compare(mouseSpy.count, 1, "Un seul click sur la souris");
            }
    }
}
