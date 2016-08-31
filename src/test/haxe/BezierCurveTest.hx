import beziercurve.BezierCurve;
import beziercurve.Vector3;

class BezierCurveTest extends haxe.unit.TestCase {
    public function testGetPercentageAtFast() {
        var startPoints : Array<Vector3> = [ new Vector3( 0, 0, 0 ), new Vector3( 2, 0, 0 ), new Vector3( 4, 0, 0)];
        var inTangentPoints : Array<Vector3> = [new Vector3( -1, 1, 0 ), new Vector3( 1, -1, 0 ), new Vector3( 3, 1, 0)];
        var outTangentPoints : Array<Vector3> = [new Vector3( 1, 1, 0 ), new Vector3( 3, 1, 0 ), new Vector3( 5, 1, 0)];
        
        var curve = new BezierCurve( startPoints, inTangentPoints, outTangentPoints);
        var result : Vector3;
        
        result = curve.GetValueAtPercentageFast(0);
        assertTrue(equals(0.0, result.x));
        assertTrue(equals(0.0, result.y));
        assertTrue(equals(0.0, result.z));
        
        result = curve.GetValueAtPercentageFast(0.5);
        assertTrue(equals(2.0, result.x));
        assertTrue(equals(0.0, result.y));
        assertTrue(equals(0.0, result.z));
        
        result = curve.GetValueAtPercentageFast(1);
        assertTrue(equals(4.0, result.x));
        assertTrue(equals(0.0, result.y));
        assertTrue(equals(0.0, result.z));
    }
  
    public function testGetPercentageAt() {
        var startPoints : Array<Vector3> = [ new Vector3( 0, 0, 0 ), new Vector3( 2, 0, 0 ), new Vector3( 4, 0, 0)];
        var inTangentPoints : Array<Vector3> = [new Vector3( -1, 1, 0 ), new Vector3( 1, -1, 0 ), new Vector3( 3, 1, 0)];
        var outTangentPoints : Array<Vector3> = [new Vector3( 1, 1, 0 ), new Vector3( 3, 1, 0 ), new Vector3( 5, 1, 0)];

        var curve = new BezierCurve( startPoints, inTangentPoints, outTangentPoints);
        var result : Vector3;

        result = curve.GetValueAtPercentage(0);
        assertTrue(equals(0.0, result.x));
        assertTrue(equals(0.0, result.y));
        assertTrue(equals(0.0, result.z));

        result = curve.GetValueAtPercentage(0.5);
        assertTrue(equals(2.0, result.x));
        assertTrue(equals(0.0, result.y));
        assertTrue(equals(0.0, result.z));

        result = curve.GetValueAtPercentage(1);
        assertTrue(equals(4.0, result.x));
        assertTrue(equals(0.0, result.y));
        assertTrue(equals(0.0, result.z));
    }
    
    public function equals( a: Float, b: Float, precision: Float = 0.00001) {
        return a > b - precision && a < b + precision;
    }
}