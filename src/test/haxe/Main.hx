
class Main {
    public function new() {
        
    }

    static function main() {
        
        var r = new haxe.unit.TestRunner();
        r.add(new BezierCurveTest());
        // add other TestCases here

        // finally, run the tests
        r.run();
	}
}