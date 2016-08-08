package odd._impl;

import java.awt.Canvas;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.image.BufferStrategy;
import java.awt.image.BufferedImage;
import java.javax.swing.JFrame;
import odd.Framebuffer;

@:allow(odd.Context)
class ContextImpl
{
    private var framebuffer : Framebuffer;
    
    private var bufferedImage : BufferedImage;
    private var canvas : Canvas;
    private var bufferStrategy : BufferStrategy;
    private var graphics : Graphics;

    public function new(width : Int, height : Int) 
    {
        trace("-- odd-target-java --");
        
        var size = new Dimension(width, height);
        
        canvas = new Canvas();
        canvas.setPreferredSize(size);
        canvas.setMinimumSize(size);
        canvas.setMaximumSize(size);
        
        bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        var dataBufferInt = cast(bufferedImage.getRaster().getDataBuffer(), java.awt.image.DataBufferInt);
        framebuffer = new Framebuffer(width, height, dataBufferInt.getData());
        
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
    
    public function run(onUpdate : Void->Void, onDraw : Framebuffer->Void) : Void
    {
        while (true)
        {
            onUpdate();
            onDraw(framebuffer);
            draw();
        }
    }
    
    private function draw() : Void
    {
        graphics.drawImage(bufferedImage, 0, 0, framebuffer.width, framebuffer.height, null);
        bufferStrategy.show();
    }
}