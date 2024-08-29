import QtQuick 2.15
import QtTest 1.0
import ".."

Item {

    SimpleCalculator {
        id: calculator;
    }

    TestCase {
        name: "simpleCalculator"
        function test_case1() {
            compare(1 + 1, 2, "sanity check");
            verify(true);
        }

        function test_add_data(){
            return [
                {tag: "2 + 2 = 4", a: 2, b: 2, answer: 4 },
                {tag: "3 + 2 = 5", a: 3, b: 2, answer: 5 },
                {tag: "10 + 5 = 15", a: 10, b: 5, answer: 15 },
                {tag: "-5 + (-5) = -10", a: -5, b: -5, answer: -10 }
            ]
        }

        function test_add(data){
            var result = calculator.add(data.a, data.b);
            compare(result, data.answer, "La fonction add devrait retourner la somme correcte");
        }

        function test_sub_data(){
            return [
                {tag: "2 - 2 = 0", a: 2, b: 2, answer: 0},
                {tag: "3 - 2 = 1", a: 3, b: 2, answer: 1},
                {tag: "10 - 5 = 5", a: 10, b: 5, answer: 5},
                {tag: "-5 - 23 = -28", a: -5, b: 23, answer: -28}
            ]
        }

        function test_sub(data){
            var result = calculator.subtract(data.a, data.b)
            compare(result, data.answer, "La fonction subtract devrait retourner la somme correcte");
        }
    }

}
