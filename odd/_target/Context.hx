package odd._target;

import java.awt.Canvas;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.awt.image.BufferStrategy;
import java.awt.image.DataBufferByte;
import java.javax.swing.JFrame;

/**
 * Java-specific context.
 */
class Context
{
    private static var instance : Context;
    
    public var width(default, null) : Int;
    public var height(default, null) : Int;
    public var framebuffer(default, null) : Int;
    
    private var callback : Float->Void;
    private var isLooping : Bool;
    
    private var bufferedImage : BufferedImage;
    private var canvas : Canvas;
    private var bufferStrategy : BufferStrategy;
    private var graphics : Graphics;

    private function new(width : Int, height : Int) 
    {
        trace("-- odd-target-java --");
        
        this.width = width;
        this.height = height;
        
        isLooping = false;
        
        var dimension = new Dimension(width, height);
        
        canvas = new Canvas();
        canvas.setPreferredSize(size);
        canvas.setMinimumSize(size);
        canvas.setMaximumSize(size);
        
        bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        
        var frame = new JFrame();
        frame.add(canvas);
        frame.setResizable(false);
        frame.pack();
        frame.setLocationRelativeTo(null);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setTitle('Odd Software Renderer');
        frame.setVisible(true);
        
        canvas.createBufferStrategy(1);
        bufferStrategy = canvas.getBufferStrategy();
        graphics = canvas.getGraphics();
    }
    
    public static function get(width : Int, height : Int) : Context
    {
        if (instance == null)
        {
            instance = new Context(width, height);
        }
        return instance;
    }
    
    public function draw() : Void
    {
        
    }
    
    /*public function loop(callback : Float->Void) : Void
    {
        this.callback = callback;
        if (!isLooping)
        {
            while (true)
            {
            }
        }
    }*/
    
    private function update(t : Float) : Void
    {
        if (callback != null)
        {
            callback(t);
        }
        
        draw();
    }
}