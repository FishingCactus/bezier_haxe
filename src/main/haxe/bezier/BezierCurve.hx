package bezier;

class BezierCurve {

    public var positionTable : Array<Vector3>;
    public var inTangentTable : Array<Vector3>;
    public var outTangentTable : Array<Vector3>;
    
    public function new( position_table : Array<Vector3>, in_tangent_table : Array<Vector3>, out_tangent_table : Array<Vector3>) {
        positionTable = position_table;
        inTangentTable = in_tangent_table;
        outTangentTable = out_tangent_table;
    }
    
    public function GetValueAtPercentageFast( percentage : Float ): Vector3 {
        var
            unnormalized_percentage,
            s,
            one_s : Float;
        var
            curve_index : Int;
        var
            p0,
            p1,
            c0,
            c1 : Vector3;

        unnormalized_percentage = 0.999999 * percentage * ( positionTable.length - 1 );    // :TRICKY: Avoid to get the last point here, so no special is made for percentage = 1.0f

        curve_index = Math.floor( unnormalized_percentage );

        p0 = positionTable[ curve_index ];
        c0 = outTangentTable[ curve_index ];
        c1 = inTangentTable[ curve_index + 1 ];
        p1 = positionTable[ curve_index + 1 ];

        s = unnormalized_percentage % 1;
        one_s = 1.0 - s;

        return p0.multiply_Float( one_s * one_s * one_s ).add_Vector3(
            c0.multiply_Float( 3 * one_s * one_s * s ) ).add_Vector3(
            c1.multiply_Float( 3 * one_s * s * s ) ).add_Vector3(
            p1.multiply_Float( s * s * s ) );
    }
    
    public function GetValueAtPercentage( percentage : Float ): Vector3 {
        if ( percentage != 1.0 )
        {
            var
                unnormalized_percentage,
                s,
                one_s : Float;
            var
                curve_index : Int;
            var
                p0,
                p1,
                c0,
                c1 : Vector3;

            unnormalized_percentage = percentage * ( positionTable.length - 1 );
            curve_index = Math.floor( unnormalized_percentage );

            p0 = positionTable[ curve_index ];
            c0 = outTangentTable[ curve_index ];
            c1 = inTangentTable[ curve_index + 1 ];
            p1 = positionTable[ curve_index + 1 ];

            s = unnormalized_percentage % 1;
            one_s = 1.0 - s;

            return p0.multiply_Float( one_s * one_s * one_s ).add_Vector3(
                c0.multiply_Float( 3 * one_s * one_s * s ) ).add_Vector3(
                c1.multiply_Float( 3 * one_s * s * s ) ).add_Vector3(
                p1.multiply_Float( s * s * s ) );
        }
        else
        {
            return positionTable[positionTable.length-1];
        }
    }
}