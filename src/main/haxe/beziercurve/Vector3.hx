package beziercurve;

class Vector3 {
    public var x : Float;
    public var y : Float;
    public var z : Float;
    
    public function new ( _x, _y, _z ) {
        x = _x;
        y = _y;
        z = _z;
    }
    
    @:op(A * B)
    @:commutative
    public function multiply_Float(rhs:Float) {
        return new Vector3(x * rhs, y * rhs, z * rhs);
    }
    
    @:op(A * B)
    @:commutative
    public function multiply_Int(rhs:Int) {
        return new Vector3(x * cast(rhs, Float), y * cast(rhs,Float), z * cast(rhs,Float));
    }
    
    @:op(A *= B)
    public function multiply_equal_Float(rhs:Float) {
        x *= rhs;
        y *= rhs;
        z *= rhs;
        return this;
    }
    
    @:op(A + B)
    public function add_Vector3(rhs:Vector3) {
        return new Vector3( x + rhs.x, y + rhs.y, z + rhs.z);
    }
    
    @:op(A += B)
    public function add_equal_Vector3(rhs:Vector3) {
        x += rhs.x;
        y += rhs.y;
        z += rhs.z;
        return this;
    }
}