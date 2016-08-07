package odd;
import odd._target.JavaContext;

/**
 * Java Swing context.
 */
class Context
{
    public static var width(default, null) : Int;
    public static var height(default, null) : Int;
    
    private static var context : JavaContext;
    
    public static function init(_width : Int, _height : Int) : Void
    {
        trace("-- odd.target.java --");
        
        if (context == null)
        {
            width = _width;
            height = _height;
            context = new JavaContext(width, height);
        }
    }
    
    public static function run(onUpdate : Void->Void, onDraw : Framebuffer->Void) : Void
    {
        if (context != null)
        {
            context.run(onUpdate, onDraw);
        }
    }
}