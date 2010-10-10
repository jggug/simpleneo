package org.jggug.utils

import java.awt.Color
import java.awt.Font
import java.awt.Graphics2D
import java.awt.RenderingHints
import java.awt.geom.Rectangle2D
import java.awt.image.BufferedImage
import javax.imageio.ImageIO

class CaptchaController {

    private static final String SOURCECHARS = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789abcdefghjklmnpqrstuvwxyz'
    private static final int IMAGE_HEIGHT = 200
    private static final int IMAGE_WIDTH = 200
    private static final int IMAGE_SPACE = 8
    private static final int IMAGE_STEP = 10

    def index = {
        response.contentType = 'image/png'
        response.setHeader('Cache-control', 'no-cache')

        // Generate and remember the Source Character string (6 characters)
        int l = SOURCECHARS.length()
        StringBuilder buffer = new StringBuilder()
        8.times {
            int r = (int)(Math.random() * l)
            buffer.append(SOURCECHARS.charAt(r))
        }
        String captchaText = buffer.toString()

        System.setProperty('java.awt.headless', 'true')
        BufferedImage bufferedImage = new BufferedImage(IMAGE_WIDTH, IMAGE_HEIGHT, BufferedImage.TYPE_INT_RGB)
        Graphics2D graphics = bufferedImage.createGraphics()
        Font font = new Font('Serif', Font.PLAIN, 18)
        graphics.font = font
        graphics.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON)
        Rectangle2D fontRect = font.getStringBounds(captchaText, graphics.fontRenderContext)
        // Now, create a graphic 'space' pixels wider and taller than the the font
        bufferedImage = new BufferedImage(
                (int)fontRect.width + IMAGE_SPACE,
                (int)fontRect.height + IMAGE_SPACE,
                BufferedImage.TYPE_INT_RGB)
        graphics = bufferedImage.createGraphics()
        graphics.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON)
        graphics.font = font

        // Draw the background
        graphics.color = Color.WHITE
        graphics.fillRect(0, 0, IMAGE_WIDTH, IMAGE_HEIGHT)

        // Draw the lines
        graphics.color = Color.GRAY
        int x1 = 0
        int y1 = IMAGE_STEP
        int x2 = IMAGE_STEP
        int y2 = 0
        while (x1 < IMAGE_WIDTH || x2 < IMAGE_WIDTH || y1 < IMAGE_HEIGHT || y2 < IMAGE_HEIGHT) {
            graphics.drawLine(x1, y1, x2, y2)
            if (y1 < IMAGE_HEIGHT) {
                x1 = 0
                y1 += IMAGE_STEP
            }
            else if (x1 < IMAGE_WIDTH) {
                y1 = IMAGE_HEIGHT
                x1 += IMAGE_STEP
            }
            else {
                x1 = IMAGE_WIDTH
                y1 = IMAGE_HEIGHT
            }

            if (x2 < IMAGE_WIDTH) {
                y2 = 0
                x2 += IMAGE_STEP
            }
            else if (y2 < IMAGE_HEIGHT) {
                x2 = IMAGE_WIDTH
                y2 += IMAGE_STEP
            }
            else {
                y2 = IMAGE_HEIGHT
                x2 = IMAGE_WIDTH
            }
        }

        // Draw the String
        graphics.color = Color.BLACK

        graphics.drawString captchaText, (int)(IMAGE_SPACE / 2),
            (int)(IMAGE_SPACE / 4) + (int)fontRect.height
        
        session.setAttribute('captcha', captchaText)
        OutputStream out = response.outputStream
        ImageIO.write(bufferedImage, 'PNG', out)
        out.close()
    }
}
